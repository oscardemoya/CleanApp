//
//  ShadowStyleView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct ShadowStyleView: TokenDetailsView {
    static let tokenType: TokenType = .shadow
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(ShadowStyle.allCases) { style in
                    Rectangle()
                        .fill(Color.mainBackground)
                        .frame(height: 80)
                        .cornerStyle(.rounded(.small))
                        .shadowStyle(style)
                }
            }
            .padding(.small)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.secondaryBackground)
    }
}

#Preview {
    ShadowStyleView()
}
