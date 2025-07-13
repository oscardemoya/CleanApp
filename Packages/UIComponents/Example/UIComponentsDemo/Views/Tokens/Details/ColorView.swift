//
//  ColorView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct ColorView: TokenDetailsView {
    static let tokenType: TokenType = .color
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.quark.value) {
                Section {
                    colorShadeStack(.primaryBrand)
                    colorShadeStack(.secondaryBrand)
                    colorShadeStack(.accentBrand)
                } header: {
                    Text("Brand")
                        .style(.headline)
                        .foregroundColor(Color.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, Spacing.nano.value)
                }
                Section {
                    colorShadeStack(.dangerFeedback)
                    colorShadeStack(.warningFeedback)
                    colorShadeStack(.successFeedback)
                } header: {
                    Text("Feedback")
                        .style(.headline)
                        .foregroundColor(Color.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, Spacing.nano.value)
                }
                Section {
                    rectangleStack(colors: .mainBackground, .secondaryBackground, .overlayBackground)
                    rectangleStack(colors: .decorativeElement, .nonDecorativeElement)
                    rectangleStack(colors: .primaryText, .secondaryText, .tertiaryText)
                } header: {
                    Text("Neutral")
                        .style(.headline)
                        .foregroundColor(Color.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, Spacing.nano.value)
                }
            }
            .padding(.small)
            .frame(maxWidth: .infinity)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.mainBackground)
    }
        
    private func colorShadeStack(_ color: Color) -> some View {
        rectangleStack(colors: ColorShade.allCases.map { color.shade($0) })
    }
    
    private func rectangleStack(colors: Color...) -> some View {
        rectangleStack(colors: colors)
    }
    
    private func rectangleStack(colors: [Color]) -> some View {
        HStack(spacing: Spacing.quark.value) {
            ForEach(colors, id: \.self) { color in
                rectangle(color: color)
            }
        }
    }
    
    private func rectangle(color: Color) -> some View {
        return Rectangle()
            .fill(color)
            .frame(width: 40, height: 40)
            .borderStyle(.stroke(.regular), cornerStyle: .rounded(.small))
    }
}

#Preview {
    ColorView()
}
