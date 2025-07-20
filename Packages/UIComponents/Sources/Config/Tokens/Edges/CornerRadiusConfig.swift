//
//  CornerRadiusConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation

public protocol CornerRadiusConfig {
    func value(for cornerRadius: CornerRadius) -> CGFloat
}

struct DefaultCornerRadiusConfig: CornerRadiusConfig {
    func value(for cornerRadius: CornerRadius) -> CGFloat {
        switch cornerRadius {
        case .nano: 2
        case .extraSmall: 4
        case .small: 8
        case .medium: 16
        case .large: 24
        case .extraLarge: 32
        }
    }
}
