//
//  KeychainKeyProtocol.swift
//  Toolkit
//
//  Created by Oscar De Moya on 2025/7/12.
//

import Foundation

public protocol KeychainKeyProtocol {
    var rawValue: String { get }
    var service: String { get }
    var accessGroup: String? { get }
}
