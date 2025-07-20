//
//  LoginView+Data.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/20.
//

import Domain

extension LoginView {
    func login() {
        Task {
            loginError = nil
            isLoggingIn = true
            defer { isLoggingIn = false }
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
