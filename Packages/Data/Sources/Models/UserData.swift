//
//  UserData.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/6.
//

import Domain

struct UserData: Codable, Identifiable {
    var id: String
}

extension UserData: DomainModelConvertible {
    var asDomainEntity: User {
        .init(
            id: id
        )
    }
}

extension User: DataModelConvertible {
    var asDataModel: UserData {
        .init(
            id: id
        )
    }
}
