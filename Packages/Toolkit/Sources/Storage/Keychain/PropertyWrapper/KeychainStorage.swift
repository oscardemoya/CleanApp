//
//  KeychainStorage.swift
//  Toolkit
//
//  Created by Oscar De Moya on 1/10/25.
//

import Foundation

@propertyWrapper
public struct KeychainStorage {
    private let key: String

    public init(key: String) {
        self.key = key
    }

    public var wrappedValue: String? {
        get {
            return KeychainHelper.shared.read(key: key)
        }
        set {
            if let newValue = newValue {
                KeychainHelper.shared.save(key: key, value: newValue)
            } else {
                KeychainHelper.shared.delete(key: key)
            }
        }
    }
}

