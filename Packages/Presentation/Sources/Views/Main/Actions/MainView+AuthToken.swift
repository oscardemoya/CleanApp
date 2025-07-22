//
//  MainView+AuthToken.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import Domain
import Toolkit

extension MainView {
    func checkAuthToken() {
        state = .initial
        do {
            guard let authService else { return }
            let token = try authService.currentAuthToken()
            logger.debug("Email: \(token.email)")
            state = .content(token)
        } catch _ as KeychainError {
            state = .empty
        } catch {
            state = .failure(error)
        }
    }
}
