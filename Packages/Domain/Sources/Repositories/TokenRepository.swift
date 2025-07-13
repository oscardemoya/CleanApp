//
//  TokenRepository.swift
//  Domain
//
//  Created by Oscar De Moya on 9/25/24.
//

import Foundation

public protocol TokenRepository: Sendable {
    func save(token: AuthToken) throws
}
