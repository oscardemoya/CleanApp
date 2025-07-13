//
//  Optional.swift
//
//
//  Created by Oscar De Moya on 19/05/24.
//

import Foundation

public extension Optional where Wrapped == String {
    var isBlank: Bool { self?.isBlank ?? true }
}
