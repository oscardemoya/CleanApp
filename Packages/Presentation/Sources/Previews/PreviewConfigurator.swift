//
//  PreviewConfigurator.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/20.
//

import SwiftUI
import DesignSystem

struct PreviewConfigurator: ViewModifier {
    init() {
        GothamFontFamily.shared.register()
        DesignSystem.configure()
    }

    func body(content: Content) -> some View {
        content.designSystem()
    }
}

extension View {
    func withPreviewConfiguration() -> some View {
        self.modifier(PreviewConfigurator())
    }
}
