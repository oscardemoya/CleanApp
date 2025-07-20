//
//  OpacityConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/19.
//

import Foundation

public protocol OpacityConfig {
    func value(for level: OpacityLevel) -> CGFloat
}

struct DefaultOpacityConfig: OpacityConfig {
    func value(for level: OpacityLevel) -> CGFloat {
        switch level {
        case .transparent: 0
        case .lighter: 0.2
        case .light: 0.4
        case .intense: 0.6
        case .intenser: 0.8
        case .semiOpaque: 0.9
        case .opaque: 1
        }
    }
}
