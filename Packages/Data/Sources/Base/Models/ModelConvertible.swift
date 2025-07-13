//
//  ModelConvertible.swift
//  Data
//
//  Created by Oscar De Moya on 10/18/24.
//

import Foundation

protocol DomainModelConvertible {
    associatedtype Entity: DataModelConvertible
    var asDomainEntity: Entity { get }
}

protocol DataModelConvertible {
    associatedtype Model: DomainModelConvertible
    var asDataModel: Model { get }
}
