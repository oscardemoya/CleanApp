//
//  BlurIntensityView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI
import UIComponents

struct BlurIntensityView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(BlurIntensity.allCases) { style in
                    Image(.sample)
                        .resizable()
                        .blur(radius: style.radius)
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 80)
                        .cornerStyle(.rounded(.small))
                }
            }
            .padding()
        }
        .navigationBarTitle("Blur")
        .background(Color.secondaryBackground)
    }
}

#Preview {
    BlurIntensityView()
}
