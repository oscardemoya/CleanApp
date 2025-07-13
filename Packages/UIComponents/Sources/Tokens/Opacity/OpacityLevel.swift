//
//  OpacityLevel.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

// TODO: Move values to a Config file
public enum OpacityLevel: CGFloat, Identifiable, Hashable, CaseIterable {
    case transparent = 0
    case lighter = 0.2
    case light = 0.4
    case intense = 0.6
    case intenser = 0.8
    case semiOpaque = 0.9
    case opaque = 1
    
    public var id: Self { self }
    public var value: CGFloat { rawValue }
}
