//
//  ForgotPasswordView+View.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI
import Domain
import UIComponents

@MainActor
extension ForgotPasswordView: View {
    public var body: some View {
        ScrollView {
            contentView
        }
        .scrollBounceBehavior(.basedOnSize)
        .navigationTitle("Forgot Password")
        .background(background)
    }
    
    @ViewBuilder var contentView: some View {
        VStack(spacing: .large) {
            TextField("Enter your ID number", text: $form.username)
                .textFieldTitle("Username")
                .keyboardType(.numberPad)
                .textFieldError(state.errorMessage)
            Button("Reset Password", action: resetPassword)
                .loadingButton(state.isLoading)
                .disabled(!form.canSubmit)
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
}

#Preview {
    ForgotPasswordView()
        .withPreviewConfiguration()
}
