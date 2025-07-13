//
//  DefaultColorConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

struct DefaultColorConfig: ColorConfig {
    
    // MARK: - Brand
    let primaryBrand: Color = Color(.primaryBrand)
    let secondaryBrand: Color = Color(.secondaryBrand)
    let accentBrand: Color = Color(.accentBrand)
    
    // MARK: - Neutral
    
    // MARK: Fixed
    let baseWhite: Color = Color(.baseWhite)
    let baseLightGray: Color = Color(.baseLightGray)
    let baseGray: Color = Color(.baseGray)
    let baseDarkGray: Color = Color(.baseDarkGray)
    let baseBlack: Color = Color(.baseBlack)
    
    // MARK: Dynamic
    var baseLight: Color = Color(.baseLight)
    var baseDark: Color = Color(.baseDark)

    // MARK: - Elements
    
    // MARK: Background
    let primaryBackground: Color = Color(.primaryBackground)
    let secondaryBackground: Color = Color(.secondaryBackground)
    var tertiaryBackground: Color = Color(.tertiaryBackground)
    let overlayBackground: Color = Color(.overlayBackground)
    
    // MARK: Text
    let primaryText: Color = Color(.primaryText)
    let secondaryText: Color = Color(.secondaryText)
    let tertiaryText: Color = Color(.tertiaryText)
    
    // MARK: Element
    let decorativeElement: Color = Color(.decorativeElement)
    let nonDecorativeElement: Color = Color(.nonDecorativeElement)

    // MARK: - Feedback
    let informativeFeedback: Color = Color(.informativeFeedback)
    let dangerFeedback: Color = Color(.dangerFeedback)
    let warningFeedback: Color = Color(.warningFeedback)
    let successFeedback: Color = Color(.successFeedback)
}
