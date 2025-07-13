//
//  LoginCredentials.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/8.
//

import Domain
import Foundation

public struct LoginCredentialsData: Codable {
    let username: String
    let password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

extension LoginCredentialsData: DomainModelConvertible {
    var asDomainEntity: LoginCredentials {
        .init(
            username: username,
            password: password
        )
    }
}

extension LoginCredentials: DataModelConvertible {
    var asDataModel: LoginCredentialsData {
        .init(
            username: username,
            password: password
        )
    }
}
