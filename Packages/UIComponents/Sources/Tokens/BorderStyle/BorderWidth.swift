//
//  BorderWidth.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import UIKit

public enum BorderWidth: CGFloat {
    case quark
    case regular
    case medium
    case large
    case extraLarge
    
    public var rawValue: CGFloat { Config.shared.borderWidth.value(for: self) }
}
