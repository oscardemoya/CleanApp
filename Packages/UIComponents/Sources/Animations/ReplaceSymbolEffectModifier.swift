//
//  ReplaceSymbolEffectModifier.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public struct ReplaceSymbolEffectModifier: ViewModifier {
    public func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .contentTransition(.symbolEffect(.replace))
        } else {
            content
        }
    }
}

// MARK: View Extension

public extension View {
    func replaceSymbolEffect() -> some View {
        modifier(ReplaceSymbolEffectModifier())
    }
}
