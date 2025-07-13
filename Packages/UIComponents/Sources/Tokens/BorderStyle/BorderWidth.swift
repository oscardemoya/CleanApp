//
//  BorderWidth.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import UIKit

// TODO: Move values to a Config file
public enum BorderWidth: CGFloat {
    case quark
    case regular = 1
    case medium = 2
    case large = 4
    case extraLarge = 8
    
    var value: CGFloat {
        switch self {
        case .quark: return 1 / UIScreen.main.scale
        default: return rawValue
        }
    }
}
