//
//  ColorConfig.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public protocol ColorConfig: Sendable {
    // MARK: - Brand
    var primaryBrand: Color { get }
    var secondaryBrand: Color { get }
    var accentBrand: Color { get }
    
    // MARK: - Neutral
    
    // MARK: Base
    var baseLight: Color { get }
    var baseDark: Color { get }
    
    // MARK: Gray
    var baseGray: Color { get }
    var baseGray2: Color { get }
    var baseGray3: Color { get }
    var baseGray4: Color { get }
    var baseGray5: Color { get }
    var baseGray6: Color { get }
    
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
