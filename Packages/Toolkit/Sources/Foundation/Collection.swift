//
//  Collection.swift
//  Toolkit
//
//  Created by Oscar De Moya on 10/31/24.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

public extension MutableCollection {
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }
        set(newValue) {
            guard let newValue = newValue, indices.contains(index) else { return }
            self[index] = newValue
        }
    }
}

public extension Collection where Element: Equatable {
    var allEqual: Bool {
        guard let firstElement = first else { return true }
        return !dropFirst().contains { $0 != firstElement }
    }
}
