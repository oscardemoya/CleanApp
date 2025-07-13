//
//  ShapeStyle.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    // MARK: - Brand
    static var primaryBrand: Color { Config.shared.color.primaryBrand }
    static var secondaryBrand: Color { Config.shared.color.secondaryBrand }
    static var accentBrand: Color { Config.shared.color.accentBrand }
    
    // MARK: - Neutral
    
    // MARK: Basic
    static var baseLight: Color { Config.shared.color.baseLight }
    static var baseDark: Color { Config.shared.color.baseDark }
    static var baseWhite: Color { Config.shared.color.baseWhite }
    static var baseLightGray: Color { Config.shared.color.baseLightGray }
    static var baseGray: Color { Config.shared.color.baseGray }
    static var baseDarkGray: Color { Config.shared.color.baseDarkGray }
    static var baseBlack: Color { Config.shared.color.baseBlack }
    
    // MARK: Background
    static var primaryBackground: Color { Config.shared.color.primaryBackground }
    static var secondaryBackground: Color { Config.shared.color.secondaryBackground }
    static var tertiaryBackground: Color { Config.shared.color.tertiaryBackground }
    static var overlayBackground: Color { Config.shared.color.overlayBackground }
    
    // MARK: Element
    static var decorativeElement: Color { Config.shared.color.decorativeElement }
    static var nonDecorativeElement: Color { Config.shared.color.nonDecorativeElement }
    
    // MARK: Text
    static var primaryText: Color { Config.shared.color.primaryText }
    static var secondaryText: Color { Config.shared.color.secondaryText }
    static var tertiaryText: Color { Config.shared.color.tertiaryText }
    
    // MARK: - Feedback
    static var informativeFeedback: Color { Config.shared.color.informativeFeedback }
    static var dangerFeedback: Color { Config.shared.color.dangerFeedback }
    static var warningFeedback: Color { Config.shared.color.warningFeedback }
    static var successFeedback: Color { Config.shared.color.successFeedback }
}
