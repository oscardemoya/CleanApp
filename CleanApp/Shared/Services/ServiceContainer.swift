//
//  ServiceContainer.swift
//  CleanApp
//
//  Created by Oscar De Moya on 2025/7/6.
//

import SwiftUI
import Networking
import CleanArchitecture
import Domain
import Data

@Observable
@MainActor
@ServiceContainer
final class ServiceContainer: ServiceProvider {
    let authService: AuthService
}
