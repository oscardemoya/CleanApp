//
//  AppKeychainKey.swift
//  Domain
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Foundation
import Toolkit

public enum AppKeychainKey: String, CaseIterable, KeychainKeyProtocol {
    public var service: String { "com.keychain" }
    public var accessGroup: String? { nil }
    
    // Authentication
    case authToken
}
