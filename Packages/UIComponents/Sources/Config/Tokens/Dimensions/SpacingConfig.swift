//
//  SpacingConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Foundation

public protocol SpacingConfig {
    func value(for spacing: Spacing) -> CGFloat
}

struct DefaultSpacingConfig: SpacingConfig {
    func value(for spacing: Spacing) -> CGFloat {
        guard let index = spacing.index else { return 0 }
        let group = index / 3
        switch group {
        case 0: return CGFloat(index * 2)
        case 1: return CGFloat(8 + (index - 3) * 4)
        default: return CGFloat(24 + (index - 6) * 8)
        }
    }
}
