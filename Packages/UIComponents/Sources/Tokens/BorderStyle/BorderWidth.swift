//
//  BorderWidth.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import UIKit

@MainActor
public enum BorderWidth: Sendable {
    case quark
    case regular
    case medium
    case large
    case extraLarge
    
    public var value: CGFloat { Config.shared.borderWidth.value(for: self) }
}
