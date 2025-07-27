//
//  Sizing.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

public enum Sizing: String, Identifiable, Hashable, CaseIterable, Sendable {
    case compact
    case regular
    case spacious
    
    public var id: Self { self }
}

@MainActor
struct SizingValues: Sendable {
    var compact: CGFloat
    var regular: CGFloat
    var spacious: CGFloat
    
    static var compactMultiplier: CGFloat { Config.shared.scaling.compact }
    static var spaciousMultiplier: CGFloat { Config.shared.scaling.spacious }
    
    init(_ baseValue: CGFloat) {
        self.compact = baseValue * Self.compactMultiplier
        self.regular = baseValue
        self.spacious = baseValue * Self.spaciousMultiplier
    }
    
    func value(for sizing: Sizing) -> CGFloat {
        switch sizing {
        case .compact: compact
        case .regular: regular
        case .spacious: spacious
        }
    }
}
