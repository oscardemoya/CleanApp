//
//  Appearance.swift
//  UIComponentsDemo
//
//  Created by Oscar De Moya on 14/03/24.
//

import SwiftUI
import UIComponents
#if canImport(UIKit)
import UIKit
#endif

struct Appearance {
    static func configure() {
        configureNavigationBars()
    }
    
    static func configureNavigationBars() {
#if !os(macOS)
        let largeTitleAppearance = UINavigationBarAppearance()
        largeTitleAppearance.largeTitleTextAttributes = [.font: TextStyle.title2.uiFont]
        let smallTitleAppearance = UINavigationBarAppearance()
        smallTitleAppearance.titleTextAttributes = [.font: TextStyle.headline.uiFont]
        UINavigationBar.appearance().standardAppearance = largeTitleAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = largeTitleAppearance
        UINavigationBar.appearance().compactAppearance = smallTitleAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = smallTitleAppearance
#endif
    }
}
