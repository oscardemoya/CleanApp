//
//  OpacityLevel.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

@MainActor
public enum OpacityLevel: CGFloat, @MainActor Identifiable, Hashable, CaseIterable, Sendable {
    case transparent
    case lighter
    case light
    case intense
    case intenser
    case semiOpaque
    case opaque
    
    public var id: Self { self }
    public var value: CGFloat { Config.shared.opacity.value(for: self) }
}
