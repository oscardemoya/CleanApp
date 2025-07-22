//
//  ForgotPasswordView+ResetPasswordAction.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Domain

extension ForgotPasswordView {
    func resetPassword() {
        Task {
            state = .loading
            do {
                guard let authService else { return }
                let request = ResetPasswordRequest(username: form.username)
                let response = try await authService.resetPassword(request: request)
                logger.debug("Username: \(response.username)")
                state = .content(response)
            } catch {
                state = .failure(error)
            }
        }
    }
}
