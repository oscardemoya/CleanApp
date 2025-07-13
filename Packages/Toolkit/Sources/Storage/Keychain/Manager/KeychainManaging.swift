//
//  KeychainManaging.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Foundation

public protocol KeychainManaging {
    associatedtype Key: KeychainKeyProtocol
    
    // String operations
    func save(_ string: String, for key: Key) throws
    func getString(for key: Key) throws -> String
    
    // Data operations
    func save(_ data: Data, for key: Key) throws
    func getData(for key: Key) throws -> Data
    
    // Codable operations
    func save<T: Codable>(_ object: T, for key: Key) throws
    func getObject<T: Codable>(_ type: T.Type, for key: Key) throws -> T
    
    // Boolean operations
    func save(_ bool: Bool, for key: Key) throws
    func getBool(for key: Key) throws -> Bool
    
    // Delete operations
    func delete(key: Key) throws
    func deleteAll(keys: [Key]) throws
    
    // Utility operations
    func exists(key: Key) -> Bool
}
