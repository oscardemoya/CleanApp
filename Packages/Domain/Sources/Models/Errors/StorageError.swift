//
//  StorageError.swift
//  Domain
//
//  Created by Oscar De Moya on 11/14/24.
//

import Foundation

public enum StorageError: LocalizedError {
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL: String(localized: "Invalid URL")
        }
    }
}
