//
//  AppColorConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI
import UIComponents

struct AppColorConfig: ColorConfig {
    static let shared = AppColorConfig()

    // MARK: - Brand
    let primaryBrand = Color(.primaryBrand)
    let secondaryBrand = Color(.secondaryBrand)
    let accentBrand = Color(.accentBrand)

    // MARK: - Neutral
    
    // MARK: Base
    let baseLight = Color(.baseLight)
    let baseDark = Color(.baseDark)

    // MARK: Gray
    let baseGray = Color(.baseGray)
    let baseGray2 = Color(.baseGray2)
    let baseGray3 = Color(.baseGray3)
    let baseGray4 = Color(.baseGray4)
    let baseGray5 = Color(.baseGray5)
    let baseGray6 = Color(.baseGray6)
        
    // MARK: - Elements
    
    // MARK: Background
    let primaryBackground = Color(.primaryBackground)
    let secondaryBackground = Color(.secondaryBackground)
    let tertiaryBackground = Color(.tertiaryBackground)
    let overlayBackground = Color(.overlayBackground)
    
    // MARK: Text
    let primaryText = Color(.primaryText)
    let secondaryText = Color(.secondaryText)
    let tertiaryText = Color(.tertiaryText)

    // MARK: Element
    let decorativeElement = Color(.decorativeElement)
    let nonDecorativeElement = Color(.nonDecorativeElement)

    // MARK: - Feedback
    let informativeFeedback = Color(.informativeFeedback)
    let dangerFeedback = Color(.dangerFeedback)
    let warningFeedback = Color(.warningFeedback)
    let successFeedback = Color(.successFeedback)
}
