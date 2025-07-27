//
//  CornerRadius.swift
//  
//
//  Created by Oscar De Moya on 13/03/24.
//

import Foundation

@MainActor
public enum CornerRadius: Sendable {
    case nano
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    
    public var value: CGFloat { Config.shared.cornerRadius.value(for: self) }
}
