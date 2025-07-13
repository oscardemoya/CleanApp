//
//  LoginView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/8.
//

import SwiftUI
import Domain

public struct LoginView: View {
    @Environment(\.services) private var services
    
    public init() {}
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggingIn: Bool = false
    @State private var loginError: String?
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                if let error = loginError {
                    Text(error)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Button(action: login) {
                    if isLoggingIn {
                        ProgressView()
                    } else {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                    }
                }
                .disabled(isLoggingIn || username.isEmpty || password.isEmpty)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                Spacer()
            }
            .padding()
            .navigationTitle("Login")
        }
    }
    
    private func login() {
        defer { isLoggingIn = false }
        isLoggingIn = true
        loginError = nil
        Task {
            do {
                guard let services else { return }
                let credentials = LoginCredentials(username: username, password: password)
                let user = try await services.authService.login(credentials: credentials)
                logger.debug("Username: \(user.username)")
            } catch {
                loginError = error.localizedDescription
            }
        }
    }
}

#Preview {
    LoginView()
}
