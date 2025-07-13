//
//  StoreError.swift
//  Data
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public enum StoreError: LocalizedError {
    case requestFailed
    case invalidData
    case notFound
    
    public var errorDescription: String? {
        switch self {
        case .requestFailed: String(localized: "Request failed")
        case .invalidData: String(localized: "Invalid data")
        case .notFound: String(localized: "Not found")
        }
    }
}
