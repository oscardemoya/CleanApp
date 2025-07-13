//
//  OpacityLevelView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct OpacityLevelView: TokenDetailsView {
    static let tokenType: TokenType = .opacity
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(OpacityLevel.allCases) { level in
                    Image(.sample)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                        .overlay {
                            Color.blackNeutral.opacity(level)
                        }
                        .cornerStyle(.rounded(.small))
                }
            }
            .padding(.small)
        }
        .navigationTitle(Self.tokenType.name)
        .background(Color.secondaryBackground)
    }
}

#Preview {
    OpacityLevelView()
}
