//
//  KeychainError.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Foundation

public enum KeychainError: LocalizedError {
    case itemNotFound
    case duplicateItem
    case invalidData
    case unableToSave(OSStatus)
    case unableToUpdate(OSStatus)
    case unableToDelete(OSStatus)
    case unableToRetrieve(OSStatus)
    case encodingFailed
    case decodingFailed
    
    public var errorDescription: String? {
        switch self {
        case .itemNotFound:
            String(localized: "keychain.error.itemNotFound", bundle: .module)
        case .duplicateItem:
            String(localized: "keychain.error.duplicateItem", bundle: .module)
        case .invalidData:
            String(localized: "keychain.error.invalidData", bundle: .module)
        case .unableToSave(let status):
            String(localized: "keychain.error.unableToSave \(status)", bundle: .module)
        case .unableToUpdate(let status):
            String(localized: "keychain.error.unableToUpdate \(status)", bundle: .module)
        case .unableToDelete(let status):
            String(localized: "keychain.error.unableToDelete \(status)", bundle: .module)
        case .unableToRetrieve(let status):
            String(localized: "keychain.error.unableToRetrieve \(status)", bundle: .module)
        case .encodingFailed:
            String(localized: "keychain.error.encodingFailed", bundle: .module)
        case .decodingFailed:
            String(localized: "keychain.error.decodingFailed", bundle: .module)
        }
    }
}
