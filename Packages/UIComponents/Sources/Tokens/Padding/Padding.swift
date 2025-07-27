//
//  Padding.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

@MainActor
public enum Padding: @MainActor Identifiable, Hashable, CaseIterable {
    case zero
    case quark
    case nano
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case big
    case huge
    case giant
    case jumbo
    
    public var id: Self { self }
    
    public var value: CGFloat {
        let baseValue = Config.shared.padding.value(for: self)
        return SizingValues(baseValue).value(for: Config.shared.sizing)
    }
    
    var index: Int? { Self.indexMap[self] }
    
    private static let indexMap: [Padding: Int] = {
        Dictionary(uniqueKeysWithValues: Padding.allCases.enumerated().map { ($1, $0) })
    }()
}
