//
//  Closeable.swift
//  UIComponents
//
//  Created by Oscar De Moya on 22/05/24.
//

import SwiftUI

public struct ClosableModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    
    @MainActor
    public enum ColorTheme {
        case light
        case dark
        
        var foregroundColor: Color {
            switch self {
            case .light: return .primaryBackground.opacity(0.75)
            case .dark: return .primaryText.opacity(0.75)
            }
        }
    }
    
    var placement: ToolbarItemPlacement = .topBarTrailing
    var theme: ColorTheme = .dark
    
    public func body(content: Content) -> some View {
        content
#if !os(macOS)
            .toolbar {
                ToolbarItem(placement: placement) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20))
                            .symbolRenderingMode(.hierarchical)
                    }
                    .foregroundColor(theme.foregroundColor)
                }
            }
#endif
    }
}

public extension View {
    func closable(_ placement: ToolbarItemPlacement = .topBarTrailing,
                  theme: ClosableModifier.ColorTheme = .dark) -> some View {
        modifier(ClosableModifier(placement: placement, theme: theme))
    }
}
