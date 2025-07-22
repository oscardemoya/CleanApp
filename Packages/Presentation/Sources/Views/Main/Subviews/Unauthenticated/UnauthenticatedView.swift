//
//  UnauthenticatedView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI

public struct UnauthenticatedView: View {
    public var body: some View {
        Text("See you later!").textStyle(.body)
        Text("👋").textStyle(.display)
    }
}

#Preview {
    UnauthenticatedView()
}
