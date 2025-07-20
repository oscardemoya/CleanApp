//
//  LoginView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/8.
//

import SwiftUI
import Domain
import DesignSystem

public struct LoginView: View {
    @Environment(\.services) var services
    
    public init() {}
    
    @State var username: String = ""
    @State var password: String = ""
    @State var isLoggingIn: Bool = false
    @State var loginError: String?
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: .small) {
                TextField("Username", text: $username)
                    .keyboardType(.numberPad)
                SecureField("Password", text: $password)
                    .textFieldError(loginError)
                Button("Login", action: login)
                    .loadingButton(isLoggingIn)
                    .disabled(username.isEmpty || password.isEmpty)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            .padding(.medium)
            .navigationTitle("Login")
        }
    }
}

#Preview {
    LoginView()
}
