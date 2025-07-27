//
//  Color.swift
//  
//
//  Created by Oscar De Moya on 12/03/24.
//

import SwiftUI

@MainActor
public extension Color {
    // MARK: - Brand
    var primaryBrand: Color { Config.shared.color.primaryBrand }
    var secondaryBrand: Color { Config.shared.color.secondaryBrand }
    var accentBrand: Color { Config.shared.color.accentBrand }
    
    // MARK: - Neutral
    
    // MARK: Base
    var baseLight: Color { Config.shared.color.baseLight }
    var baseDark: Color { Config.shared.color.baseDark }

    // MARK: Gray
    var baseGray: Color { Config.shared.color.baseGray }
    var baseGray2: Color { Config.shared.color.baseGray2 }
    var baseGray3: Color { Config.shared.color.baseGray3 }
    var baseGray4: Color { Config.shared.color.baseGray4 }
    var baseGray5: Color { Config.shared.color.baseGray5 }
    var baseGray6: Color { Config.shared.color.baseGray6 }
    
    // MARK: - Elements
    
    // MARK: Background
    var primaryBackground: Color { Config.shared.color.primaryBackground }
    var secondaryBackground: Color { Config.shared.color.secondaryBackground }
    var tertiaryBackground: Color { Config.shared.color.tertiaryBackground }
    var overlayBackground: Color { Config.shared.color.overlayBackground }
    
    // MARK: Element
    var decorativeElement: Color { Config.shared.color.decorativeElement }
    var nonDecorativeElement: Color { Config.shared.color.nonDecorativeElement }
    
    // MARK: Text
    var primaryText: Color { Config.shared.color.primaryText }
    var secondaryText: Color { Config.shared.color.secondaryText }
    var tertiaryText: Color { Config.shared.color.tertiaryText }
    
    // MARK: - Feedback
    var informativeFeedback: Color { Config.shared.color.informativeFeedback }
    var dangerFeedback: Color { Config.shared.color.dangerFeedback }
    var warningFeedback: Color { Config.shared.color.warningFeedback }
    var successFeedback: Color { Config.shared.color.successFeedback }
}
