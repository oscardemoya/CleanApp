//
//  LoginUseCase.swift
//  Domain
//
//  Created by Oscar De Moya on 10/7/24.
//

import Foundation
import CleanArchitecture

@Injectable<TokenRepository>
public struct LogoutUseCase {
    public func execute() throws {
        try tokenRepository.deleteCurrentAuthToken()
    }
}
