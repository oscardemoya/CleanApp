//
//  OpacityModifier.swift
//
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

public extension View {
    func opacity(_ opacity: OpacityLevel) -> some View {
        modifier(
            OpacityModifier(opacity: opacity)
        )
    }
}

private struct OpacityModifier: ViewModifier {
    var opacity: OpacityLevel
    
    func body(content: Content) -> some View {
        content.opacity(opacity.value)
    }
}
