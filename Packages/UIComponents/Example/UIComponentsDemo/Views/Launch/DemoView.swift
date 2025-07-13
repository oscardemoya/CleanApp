//
//  DemoView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI
import UIComponents

struct DemoView: View {
    var body: some View {
        VStack(spacing: .medium) {
            Text("Aa")
                .style(.header)
                .foregroundColor(.secondaryBrand)
                .padding(.small)
                .background(Color.primaryBrand.shade(.shade2))
                .foregroundColor(.primaryText)
                .borderStyle(.stroke(.large), borderColor: .secondaryBrand, cornerStyle: .rounded(.medium))
            VStack {
                Text("Hello, World!")
                    .style(.title2)
                    .foregroundColor(.primaryText)
                Text("This is a test")
                    .style(.body)
                    .foregroundColor(.tertiaryText)
            }
        }
    }
}

#Preview {
    DemoView()
}
