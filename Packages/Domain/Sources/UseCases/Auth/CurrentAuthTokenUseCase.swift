//
//  CurrentAuthTokenUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 10/7/24.
//

import Foundation
import CleanArchitecture

@Injectable<TokenRepository>
public struct CurrentAuthTokenUseCase {
    public func execute() throws -> AuthToken {
        try tokenRepository.currentAuthToken()
    }
}
