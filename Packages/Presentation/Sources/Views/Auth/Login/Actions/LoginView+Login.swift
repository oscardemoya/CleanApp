//
//  LoginView+Login.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Domain

extension LoginView {
    func login() {
        Task {
            state = .loading
            do {
                guard let authService else { return }
                let credentials = LoginCredentials(username: form.username, password: form.password)
                let token = try await authService.login(credentials: credentials)
                logger.debug("Access Token: \(token.email)")
                state = .content(token)
            } catch {
                state = .failure(error)
            }
        }
    }
}
