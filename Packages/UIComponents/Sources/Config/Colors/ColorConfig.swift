//
//  ColorConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public protocol ColorConfig {
    // MARK: - Brand
    var primaryBrand: Color { get }
    var secondaryBrand: Color { get }
    var accentBrand: Color { get }
    
    // MARK: - Neutral
    
    // MARK: Fixed
    var baseWhite: Color { get }
    var baseLightGray: Color { get }
    var baseGray: Color { get }
    var baseDarkGray: Color { get }
    var baseBlack: Color { get }
    
    // MARK: Dynamic
    var baseLight: Color { get }
    var baseDark: Color { get }
    
    // MARK: - Elements
    
    // MARK: Background
    var primaryBackground: Color { get }
    var secondaryBackground: Color { get }
    var tertiaryBackground: Color { get }
    var overlayBackground: Color { get }
    
    // MARK: Text
    var primaryText: Color { get }
    var secondaryText: Color { get }
    var tertiaryText: Color { get }
    
    // MARK: Element
    var decorativeElement: Color { get }
    var nonDecorativeElement: Color { get }
    
    // MARK: - Feedback
    var informativeFeedback: Color { get }
    var dangerFeedback: Color { get }
    var warningFeedback: Color { get }
    var successFeedback: Color { get }
}
