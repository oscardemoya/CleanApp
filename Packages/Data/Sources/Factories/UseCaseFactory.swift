//
//  UseCaseFactory.swift
//  Data
//
//  Created by Oscar De Moya on 10/11/24.
//

import Networking
import CleanArchitecture
import Domain

@Injectable<RepositoryFactory>
public struct UseCaseFactory {
    #MakeUseCase<AuthRepository & TokenRepository, LoginUseCase>()
}
