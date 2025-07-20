//
//  ShadowConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 2025/7/20.
//

import Foundation

public protocol ShadowConfig {
    func opacity(for style: ShadowStyle) -> CGFloat
    func radius(for style: ShadowStyle) -> CGFloat
    func offset(for style: ShadowStyle) -> CGPoint
}

struct DefaultShadowConfig: ShadowConfig {
    func opacity(for style: ShadowStyle) -> CGFloat {
        switch style {
        case .subtle: 0.16
        case .light: 0.32
        case .medium: 0.48
        case .intense: 0.64
        }
    }
    
    func radius(for style: ShadowStyle) -> CGFloat {
        switch style {
        case .subtle: 1
        case .light: 2
        case .medium: 4
        case .intense: 8
        }
    }
    
    func offset(for style: ShadowStyle) -> CGPoint {
        switch style {
        case .subtle: CGPoint(x: 0, y: 1)
        case .light: CGPoint(x: 0, y: 2)
        case .medium: CGPoint(x: 0, y: 4)
        case .intense: CGPoint(x: 0, y: 8)
        }
    }
}
