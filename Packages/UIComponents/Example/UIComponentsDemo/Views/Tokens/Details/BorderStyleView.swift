//
//  BorderStyleView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct BorderStyleView: TokenDetailsView {
    static let tokenType: TokenType = .borderStyle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(BorderStyle.allCases) { style in
                    Rectangle()
                        .fill(Color.mainBackground)
                        .frame(height: 80)
                        .borderStyle(style, borderColor: .decorativeElement, cornerStyle: .rounded(.small))
                }
            }
            .padding(.small)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.secondaryBackground)
    }
}

#Preview {
    BorderStyleView()
}
