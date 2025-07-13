//
//  Sizing.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

import SwiftUI

// TODO: Move values to a Config file
public enum Sizing: String, Identifiable, Hashable, CaseIterable {
    case compact
    case regular
    case spacious
    
    public var id: Self { self }
}

struct SizingValues {
    var compact: CGFloat
    var regular: CGFloat
    var spacious: CGFloat
    
    static var compactMultiplier: CGFloat = 0.5
    static var spaciousMultiplier: CGFloat = 2
    
    init(_ regular: CGFloat) {
        self.compact = regular * SizingValues.compactMultiplier
        self.regular = regular
        self.spacious = regular * SizingValues.spaciousMultiplier
    }
    
    func value(for sizing: Sizing) -> CGFloat {
        switch sizing {
        case .compact: compact
        case .regular: regular
        case .spacious: spacious
        }
    }
}
