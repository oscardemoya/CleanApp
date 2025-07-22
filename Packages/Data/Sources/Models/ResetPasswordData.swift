//
//  ResetPasswordData.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/8.
//

import CleanArchitecture
import Domain
import Foundation

@ModelConvertible
struct ResetPasswordRequestData: Codable {
    @Convertible(key: "username")
    let email: String
}

@ModelConvertible
struct ResetPasswordResponseData: Codable {
    @Convertible(key: "username")
    let email: String
}
