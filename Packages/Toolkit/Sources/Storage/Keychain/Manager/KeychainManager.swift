//
//  KeychainManager.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Foundation
import Security

public final class KeychainManager<Key: KeychainKeyProtocol>: KeychainManaging {
    
    public init() {}
    
    // MARK: - String Operations
    public func save(_ string: String, for key: Key) throws {
        guard let data = string.data(using: .utf8) else {
            throw KeychainError.encodingFailed
        }
        try save(data, for: key)
    }
    
    public func getString(for key: Key) throws -> String {
        let data = try getData(for: key)
        guard let string = String(data: data, encoding: .utf8) else {
            throw KeychainError.decodingFailed
        }
        return string
    }
    
    // MARK: - Data Operations
    public func save(_ data: Data, for key: Key) throws {
        let query = createQuery(for: key)
        
        // First try to update
        var updateQuery = query
        updateQuery[kSecValueData as String] = data
        
        let updateStatus = SecItemUpdate(
            query as CFDictionary,
            [kSecValueData as String: data] as CFDictionary
        )
        
        if updateStatus == errSecItemNotFound {
            // Item doesn't exist, create it
            var addQuery = query
            addQuery[kSecValueData as String] = data
            
            let addStatus = SecItemAdd(addQuery as CFDictionary, nil)
            guard addStatus == errSecSuccess else {
                throw KeychainError.unableToSave(addStatus)
            }
        } else if updateStatus != errSecSuccess {
            throw KeychainError.unableToUpdate(updateStatus)
        }
    }
    
    public func getData(for key: Key) throws -> Data {
        var query = createQuery(for: key)
        query[kSecReturnData as String] = true
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                throw KeychainError.itemNotFound
            }
            throw KeychainError.unableToRetrieve(status)
        }
        
        guard let data = result as? Data else {
            throw KeychainError.invalidData
        }
        
        return data
    }
    
    // MARK: - Codable Operations
    public func save<T: Codable>(_ object: T, for key: Key) throws {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        do {
            let data = try encoder.encode(object)
            try save(data, for: key)
        } catch {
            throw KeychainError.encodingFailed
        }
    }
    
    public func getObject<T: Codable>(_ type: T.Type, for key: Key) throws -> T {
        let data = try getData(for: key)
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            return try decoder.decode(type, from: data)
        } catch {
            throw KeychainError.decodingFailed
        }
    }
    
    // MARK: - Boolean Operations
    public func save(_ bool: Bool, for key: Key) throws {
        let string = bool ? "true" : "false"
        try save(string, for: key)
    }
    
    public func getBool(for key: Key) throws -> Bool {
        let string = try getString(for: key)
        return string == "true"
    }
    
    // MARK: - Delete Operations
    public func delete(key: Key) throws {
        let query = createQuery(for: key)
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.unableToDelete(status)
        }
    }
    
    public func deleteAll(keys: [Key]) throws {
        for key in keys {
            try delete(key: key)
        }
    }
    
    // MARK: - Utility Operations
    public func exists(key: Key) -> Bool {
        do {
            _ = try getData(for: key)
            return true
        } catch {
            return false
        }
    }
    
    // MARK: - Private Helpers
    private func createQuery(for key: Key) -> [String: Any] {
        var query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key.service,
            kSecAttrAccount as String: key.rawValue,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        
        if let accessGroup = key.accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup
        }
        
        return query
    }
}
