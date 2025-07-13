//
//  Padding.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

// TODO: Move values to a Config file
public enum Padding: CGFloat, Identifiable, Hashable, CaseIterable {
    case zero = 0
    case quark = 4
    case nano = 8
    case extraSmall = 12
    case small = 16
    case medium = 24
    case large = 32
    case extraLarge = 40
    case big = 48
    case huge = 56
    case giant = 64
    case jumbo = 80
    
    public var id: Self { self }
    public var value: CGFloat { values.value(for: Config.shared.sizing) }
    
    private var values: SizingValues { .init(rawValue) }
}
