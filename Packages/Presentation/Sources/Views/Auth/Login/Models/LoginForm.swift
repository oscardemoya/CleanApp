//
//  LoginForm.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import Domain

struct LoginForm {
    var username: String = ""
    var password: String = ""
    
    var canSubmit: Bool {
        ![username, password].contains(where: \.isEmpty)
    }
}
