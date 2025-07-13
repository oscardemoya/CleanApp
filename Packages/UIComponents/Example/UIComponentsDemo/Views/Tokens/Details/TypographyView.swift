//
//  TypographyView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct TypographyView: TokenDetailsView {
    static let tokenType: TokenType = .typography
    
    var body: some View {
        ScrollView {
            ForEach(TextStyle.allCases, id: \.self) { style in
                Text(style.alias)
                    .style(style)
                    .foregroundColor(Color.primaryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding(.small)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.mainBackground)
    }
}

#Preview {
    TypographyView()
}
