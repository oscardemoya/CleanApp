//
//  Array.swift
//  Toolkit
//
//  Created by Oscar De Moya on 10/31/24.
//

import Foundation

public extension Array where Element: Hashable {
    func uniqued() -> [Element] {
        var newCollection = Set<Element>()
        return filter { newCollection.insert($0).inserted }
    }
}

public extension Array {
    func unique<T: Hashable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        reduce(into: [Element]()) { result, element in
            if !result.contains(where: { $0[keyPath: keyPath] == element[keyPath: keyPath] }) {
                result.append(element)
            }
        }
    }
}
