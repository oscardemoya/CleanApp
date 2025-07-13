//
//  BlurIntensityView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct BlurIntensityView: TokenDetailsView {
    static let tokenType: TokenType = .blur
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(BlurIntensity.allCases) { intensity in
                    Image(.sample)
                        .resizable()
                        .blur(intensity)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
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
    BlurIntensityView()
}
