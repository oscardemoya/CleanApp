//
//  UserData.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import CleanArchitecture
import Domain

@ModelConvertible
struct UserData: Codable, Identifiable {
    var id: String
}
