//
//  DesignSystemModifier.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/19.
//

import SwiftUI
import UIComponents

struct DesignSystemModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.primary)
            .buttonStyle(.primary)
    }
}

public extension View {
    func designSystem() -> some View {
        self.modifier(DesignSystemModifier())
    }
}
