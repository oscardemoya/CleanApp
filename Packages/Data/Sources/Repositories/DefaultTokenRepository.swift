//
//  DefaultTokenRepository.swift
//  Data
//
//  Created by Oscar De Moya on 2025/7/12.
//

import CleanArchitecture
import Domain

@Injectable<TokenDataSource>
final class DefaultTokenRepository: TokenRepository, Sendable {
    func save(token: AuthToken) throws {
        try tokenDataSource.save(token: AuthTokenData(entity: token))
    }
}
