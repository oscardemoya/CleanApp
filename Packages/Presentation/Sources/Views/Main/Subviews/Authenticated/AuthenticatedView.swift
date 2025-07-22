//
//  AuthenticatedView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/20.
//

import SwiftUI
import UIComponents
import CleanArchitecture
import Domain

public struct AuthenticatedView {
    @Environment(\.authService) var authService: AuthService?
    @Binding var authState: ViewState<AuthToken>
    
    public init(authState: Binding<ViewState<AuthToken>>) {
        self._authState = authState
    }
}
