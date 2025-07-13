//
//  File.swift
//  
//
//  Created by Oscar De Moya on 19/05/24.
//

import Foundation

public protocol CaseInsensitive: RawRepresentable, CaseIterable {
    var stringValue: String { get }
}

public extension CaseInsensitive where RawValue == String {
    init?(rawValue: String) {
        let string = rawValue.replacingOccurrences(of: " ", with: "")
        let match = Self.allCases.first { $0.rawValue.compare(string, options: .caseInsensitive) == .orderedSame }
        guard let value = match else { return nil }
        self = value
    }
    
    var stringValue: String { rawValue }
}
