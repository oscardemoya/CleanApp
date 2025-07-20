//
//  CornerRadius.swift
//  
//
//  Created by Oscar De Moya on 13/03/24.
//

import Foundation

public enum CornerRadius: CGFloat {
    case nano
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    
    public var rawValue: CGFloat { Config.shared.cornerRadius.value(for: self) }
}
