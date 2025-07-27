//
//  LoginView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/8.
//

import SwiftUI
import Domain
import UIComponents

@MainActor
public struct LoginView {
    @Environment(\.authService) var authService: AuthService?
    @Binding var state: ViewState<AuthToken>
    @State var form = LoginForm()
    @State var path = NavigationPath()
    
    public enum Destination: String, Hashable, Sendable {
        case forgotPassword
    }
    
    public init(state: Binding<ViewState<AuthToken>>) {
        self._state = state
    }
}
