//
//  ForgotPasswordView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/8.
//

import SwiftUI
import Domain
import UIComponents

public struct ForgotPasswordView {
    @Environment(\.authService) var authService: AuthService?
    @State var state: ViewState<ResetPasswordResponse> = .initial
    @State var form = ForgotPasswordFormModel()
    
    public init() {}
}
