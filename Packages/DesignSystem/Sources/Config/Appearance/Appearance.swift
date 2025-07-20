//
//  Appearance.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 9/19/24.
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
#if !os(macOS) && !targetEnvironment(macCatalyst)
        let largeTitleAppearance = UINavigationBarAppearance()
        largeTitleAppearance.largeTitleTextAttributes = [.font: TextStyle.title2.uiFont]
        let smallTitleAppearance = UINavigationBarAppearance()
        smallTitleAppearance.titleTextAttributes = [.font: TextStyle.headline.uiFont]
        
        largeTitleAppearance.configureWithTransparentBackground()
        largeTitleAppearance.backgroundColor = .clear
        largeTitleAppearance.shadowColor = .clear
        largeTitleAppearance.shadowImage = UIImage()
        
        smallTitleAppearance.configureWithTransparentBackground()
        smallTitleAppearance.backgroundColor = .clear
        smallTitleAppearance.shadowColor = .clear
        smallTitleAppearance.shadowImage = UIImage()

        UINavigationBar.appearance().standardAppearance = largeTitleAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = largeTitleAppearance
        UINavigationBar.appearance().compactAppearance = smallTitleAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = smallTitleAppearance
#else
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let titlebar = windowScene.titlebar {
            titlebar.separatorStyle = .none
        }
#endif
    }
}
