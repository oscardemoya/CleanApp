//
//  ArrayAsyncSequence.swift
//  Toolkit
//
//  Created by Oscar De Moya on 10/25/24.
//

import Foundation

public struct ArrayAsyncSequence<Element>: AsyncSequence {
    private let items: [Element]

    public init(items: [Element]) {
        self.items = items
    }

    public func makeAsyncIterator() -> Iterator {
        Iterator(items: items)
    }

    public struct Iterator: AsyncIteratorProtocol {
        private var currentIndex = 0
        private let items: [Element]

        init(items: [Element]) {
            self.items = items
        }

        mutating public func next() async -> Element? {
            guard currentIndex < items.count else { return nil }
            defer { currentIndex += 1 }
            return items[currentIndex]
        }
    }
}
