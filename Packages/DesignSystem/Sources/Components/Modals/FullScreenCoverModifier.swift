//
//  FullScreenCoverModifier.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/20.
//

import SwiftUI
import UIComponents

struct FullScreenCoverModifier<CoverContent: View>: ViewModifier {
    let condition: () -> Bool
    let onDismiss: (() -> Void)?
    @ViewBuilder let coverContent: () -> CoverContent
    
    private var isPresented: Binding<Bool> {
        Binding(
            get: { condition() },
            set: { _ in }
        )
    }
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: isPresented, onDismiss: onDismiss) {
                coverContent().designSystem()
            }
    }
}

public extension View {
    func fullScreenCover<CoverContent: View>(
        isPresented condition: @escaping () -> Bool,
        onDismiss: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> CoverContent
    ) -> some View {
        self.modifier(FullScreenCoverModifier(condition: condition, onDismiss: onDismiss, coverContent: content))
    }
}
