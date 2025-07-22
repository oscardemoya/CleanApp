//
//  ModelConvertible.swift
//  Data
//
//  Created by Oscar De Moya on 10/18/24.
//

import Foundation

protocol ModelConvertible {
    associatedtype Entity
    var asDomainEntity: Entity { get }
    init(entity: Entity)
}
