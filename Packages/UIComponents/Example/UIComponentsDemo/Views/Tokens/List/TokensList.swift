//
//  TokensList.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 4/03/24.
//

import SwiftUI

enum TokenType: String, CaseIterable, Identifiable {
    case color
    case typography
    case cornerStyle = "Corner Style"
    case borderStyle = "Border Style"
    case shadow
    case blur
    case opacity
    case padding
    case spacing
    
    var id: String { rawValue }
    var name: String { rawValue.capitalized }
}

struct TokensList: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(TokenType.allCases) { tokenType in
                NavigationLink(value: tokenType) {
                    Text(tokenType.name)
                        .style(.body)
                        .listRowBackground(Color.mainBackground)
                }
            }
            .listStyle(.plain)
            .navigationDestination(for: TokenType.self) { tokenType in
                destinationView(for: tokenType)
            }
            .navigationTitle("Tokens")
            .background(Color.secondaryBackground)
            .scrollContentBackground(.hidden)
        }
    }
    
    private func destinationView(for tokenType: TokenType) -> some View {
        switch tokenType {
        case .color: AnyView(ColorView())
        case .typography: AnyView(TypographyView())
        case .cornerStyle: AnyView(CornerStyleView())
        case .borderStyle: AnyView(BorderStyleView())
        case .shadow: AnyView(ShadowStyleView())
        case .blur: AnyView(BlurIntensityView())
        case .opacity: AnyView(OpacityLevelView())
        case .padding: AnyView(PaddingView())
        case .spacing: AnyView(SpacingView())
        }
    }
}

#Preview {
    TokensList()
}
