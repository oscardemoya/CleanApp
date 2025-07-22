//
//  MainView+View.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI
import UIComponents
import CleanArchitecture
import Domain

extension MainView: View {
    public var body: some View {
        Group {
            if state.hasContent {
                AuthenticatedView(authState: $state)
            } else {
                UnauthenticatedView()
            }
        }
        .onAppear(perform: checkAuthToken)
        .fullScreenCover { !state.canDisplayContent } content: {
            LoginView(state: $state)
        }
    }
}

#Preview("Logged In") {
    MainView()
        .withPreviewConfiguration()
        .environment(\.authService, MockAuthService())
}

#Preview("Logged Out") {
    MainView()
        .withPreviewConfiguration()
        .environment(\.authService, MockAuthService(currentToken: nil))
}
