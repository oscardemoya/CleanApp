//
//  AuthenticatedView+Action.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/18.
//

import Domain

extension AuthenticatedView {
    func logout() {
        Task {
            authState = .loading
            do {
                guard let authService else { return }
                try authService.logout()
                authState = .empty
            } catch {
                authState = .failure(error)
            }
        }
    }
}
