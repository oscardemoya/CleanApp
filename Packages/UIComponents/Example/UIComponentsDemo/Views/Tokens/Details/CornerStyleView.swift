//
//  CornerStyleView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct CornerStyleView: TokenDetailsView {
    static let tokenType: TokenType = .cornerStyle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(CornerStyle.allCases) { style in
                    Rectangle()
                        .fill(Color.primaryBrand)
                        .frame(height: 100)
                        .cornerStyle(style)
                }
            }
            .padding(.small)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.mainBackground)
    }
}

#Preview {
    CornerStyleView()
}
