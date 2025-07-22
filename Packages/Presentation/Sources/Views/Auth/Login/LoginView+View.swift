//
//  LoginView+View.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI
import Domain
import UIComponents

extension LoginView: View {
    public var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                contentView
                    .navigationDestination(for: Destination.self, destination: destination)
            }
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Login")
            .background(background)
        }
    }
    
    @ViewBuilder var contentView: some View {
        VStack(spacing: .large) {
            TextField("Enter your ID number", text: $form.username)
                .textFieldTitle("Username")
                .keyboardType(.numberPad)
            SecureField("Enter your password", text: $form.password)
                .textFieldTitle("Password")
                .textFieldError(state.errorMessage)
            Button("Login", action: login)
                .loadingButton(state.isLoading)
                .disabled(!form.canSubmit)
            Button("Forgot Password") { path.append(Destination.forgotPassword) }
                .buttonStyle(.primaryText)
            Spacer()
        }
        .padding(.medium)
    }
    
    @ViewBuilder var background: some View {
        LinearGradient(
            gradient: Gradient(colors: [.tertiaryBackground, .primaryBackground]),
            startPoint: .top,
            endPoint: .center
        )
        .ignoresSafeArea()
    }
    
    @ViewBuilder func destination(screen: Destination) -> some View {
        switch screen {
        case .forgotPassword: ForgotPasswordView()
        }
    }
}

#Preview {
    @Previewable @State var state: ViewState<AuthToken> = .initial
    LoginView(state: $state)
        .withPreviewConfiguration()
}
