//
//  PaddingView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct PaddingView: TokenDetailsView {
    static let tokenType: TokenType = .padding
    @State var items: [CGFloat] = Padding.allCases.map(\.value)
    @State private var selectedOption: Sizing = UIComponents.currentSizing
    let sizingOptions: [Sizing] = [.compact, .regular, .spacious]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(spacing: Spacing.nano.value) {
                    ForEach(items, id: \.self) { padding in
                        Text("Aa")
                            .style(.body)
                            .padding(padding)
                            .background(Color.primaryBrand)
                            .foregroundColor(.primaryText)
                            .cornerStyle(.rounded(.small))
                    }
                }
                .padding(.small)
                .frame(maxWidth: .infinity)
            }
        }
        .background(Color.secondaryBackground)
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
            items = Padding.allCases.map(\.value)
        }
    }
}

#Preview {
    PaddingView()
}
