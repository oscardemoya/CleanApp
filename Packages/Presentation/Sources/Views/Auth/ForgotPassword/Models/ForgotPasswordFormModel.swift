//
//  ForgotPasswordFormModel.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import Domain

struct ForgotPasswordFormModel {
    var username: String = ""
    
    var canSubmit: Bool {
        !username.isEmpty
    }
}
