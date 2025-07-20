//
//  BlurConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/19.
//

import Foundation

public protocol BlurConfig {
    func radius(for intensity: BlurIntensity) -> CGFloat
}

struct DefaultBlurConfig: BlurConfig {
    func radius(for intensity: BlurIntensity) -> CGFloat {
        switch intensity {
        case .none: 0
        case .light: 8
        case .medium: 24
        case .intense: 40
        }
    }
}
