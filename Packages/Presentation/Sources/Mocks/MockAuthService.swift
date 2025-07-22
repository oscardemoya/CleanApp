//
//  MockAuthService.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

#if DEBUG
import Toolkit
import CleanArchitecture
import Domain

final class MockAuthService: AuthService {
    var currentUser: User?
    var currentToken: AuthToken?
    
    init(
        currentUser: User? = User(id: "12345"),
        currentToken: AuthToken? = AuthToken(id: 1, email: "email@example.com")
    ) {
        self.currentUser = currentUser
        self.currentToken = currentToken
    }
    
    func login(credentials: LoginCredentials) async throws -> AuthToken {
        guard let currentToken else { throw KeychainError.itemNotFound }
        return currentToken
    }
    
    func currentAuthToken() throws -> AuthToken {
        guard let currentToken else { throw KeychainError.itemNotFound }
        return currentToken
    }
    
    func logout() throws {
        guard currentUser != nil else { throw AuthError.unauthenticated }
        currentUser = nil
    }
    
    func resetPassword(request: ResetPasswordRequest) async throws -> ResetPasswordResponse {
        ResetPasswordResponse(username: "username")
    }
}
#endif
