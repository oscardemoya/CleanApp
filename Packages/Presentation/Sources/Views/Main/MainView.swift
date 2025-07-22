//
//  MainView.swift
//  Presentation
//
//  Created by Oscar De Moya on 2025/7/21.
//

import SwiftUI
import UIComponents
import CleanArchitecture
import Domain

public struct MainView {
    @Environment(\.authService) var authService: AuthService?
    @State var state: ViewState<AuthToken> = .initial
    
    public init() {}
}
