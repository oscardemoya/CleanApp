//
//  LoadingButtonModifier.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/19.
//

import SwiftUI

struct LoadingButtonModifier: ViewModifier {
    let isLoading: Bool

    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            if isLoading {
                content
                    .disabled(true)
                ProgressView()
                    .padding(.small)
            } else {
                content
            }
        }
    }
}

public extension View {
    func loadingButton(_ isLoading: Bool) -> some View {
        self.modifier(LoadingButtonModifier(isLoading: isLoading))
    }
}
