//
//  AuthenticatedView+View.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI
import UIComponents
import CleanArchitecture
import Domain

extension AuthenticatedView: View {
    public var body: some View {
        NavigationStack {
            VStack(spacing: .nano) {
                Text("Welcome").textStyle(.title2)
                Text("To the jungle!").textStyle(.body)
                Text("🐯").textStyle(.display)
                Button("Logout", action: logout).fixedSize().padding(.small)
            }
        }
    }
}

#Preview {
    @Previewable @State var state: ViewState<AuthToken> = .initial
    AuthenticatedView(authState: $state)
        .withPreviewConfiguration()
}
