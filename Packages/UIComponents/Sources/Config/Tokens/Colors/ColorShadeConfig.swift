//
//  ColorShadeConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import SwiftUI

public protocol ColorShadeConfig: Sendable {
    func blendIntensity(shade: ColorShade) -> CGFloat
}

struct DefaultColorShadeConfig: ColorShadeConfig {
    func blendIntensity(shade: ColorShade) -> CGFloat {
        switch shade {
        case .shade1: 0.9
        case .shade2: 0.6
        case .shade3: 0.2
        case .shade4: 0
        case .shade5: 0.2
        case .shade6: 0.6
        case .shade7: 0.9
        }
    }
}
