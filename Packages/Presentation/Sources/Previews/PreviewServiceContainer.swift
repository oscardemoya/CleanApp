//
//  PreviewServiceContainer.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

#if DEBUG
import Domain

final class PreviewServiceContainer: ServiceProvider {
    let authService: AuthService = MockAuthService()
}
#endif
