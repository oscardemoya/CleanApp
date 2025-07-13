//
//  TokenDetailsView.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI

protocol TokenDetailsView: View {
    static var tokenType: TokenType { get }
}
