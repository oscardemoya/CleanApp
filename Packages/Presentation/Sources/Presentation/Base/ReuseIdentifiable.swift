//
//  ReuseIdentifiable.swift
//  
//
//  Created by Oscar De Moya on 13/10/22.
//

import Foundation

public protocol ReuseIdentifiable { static var reuseIdentifier: String { get } }

public extension ReuseIdentifiable {
    static var reuseIdentifier: String { String(describing: Self.self) }
}
