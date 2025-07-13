//
//  ShadowStyle.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public enum ShadowStyle: Identifiable, Hashable, CaseIterable {
    case subtle
    case light
    case medium
    case intense

    public var id: Self { self }
    private static let offsetMultiplier: CGFloat = 0.5
    
    // TODO: Move values to a Config file
    public var opacity: CGFloat {
        switch self {
        case .subtle: 0.16
        case .light: 0.32
        case .medium: 0.48
        case .intense: 0.64
        }
    }
    
    // TODO: Move values to a Config file
    public var radius: CGFloat {
        switch self {
        case .subtle: 1
        case .light: 2
        case .medium: 4
        case .intense: 8
        }
    }
    
    // TODO: Move values to a Config file
    public var offset: CGPoint {
        switch self {
        case .subtle: CGPoint(x: 0, y: 2 * Self.offsetMultiplier)
        case .light: CGPoint(x: 0, y: 4 * Self.offsetMultiplier)
        case .medium: CGPoint(x: 0, y: 8 * Self.offsetMultiplier)
        case .intense: CGPoint(x: 0, y: 16 * Self.offsetMultiplier)
        }
    }
}
