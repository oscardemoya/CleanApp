//
//  SpacingView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct SpacingView: TokenDetailsView {
    static let tokenType: TokenType = .spacing
    @State var items: [CGFloat] = Spacing.allCases.map(\.value)
    @State private var selectedOption: Sizing = UIComponents.currentSizing
    let sizingOptions: [Sizing] = [.compact, .regular, .spacious]

    var body: some View {
        VStack {
            ScrollView {
                ForEach(items, id: \.self) { spacing in
                    Rectangle()
                        .fill(Color.primaryBrand)
                        .frame(width: 40, height: 40)
                        .cornerStyle(.rounded(.small))
                    Spacer(minLength: spacing)
                }
                .frame(maxWidth: .infinity)
                .padding(.small)
            }
            .background(Color.secondaryBackground)
        }
        .navigationTitle(Self.tokenType.name)
        .toolbar {
            ToolbarItem(placement: .status) {
                sizingOptionsPicker
            }
        }
    }
    
    private var sizingOptionsPicker: some View {
        return Picker("", selection: $selectedOption) {
            ForEach(sizingOptions, id: \.self) { option in
                Text(option.rawValue.capitalized).tag(option)
            }
        }
        .fixedSize()
        .padding(.small)
        .pickerStyle(.segmented)
        .onChange(of: selectedOption, initial: true) { _, newValue in
            UIComponents.configure(sizing: newValue)
            items = Spacing.allCases.map(\.value)
        }
    }
}

#Preview {
    SpacingView()
}
