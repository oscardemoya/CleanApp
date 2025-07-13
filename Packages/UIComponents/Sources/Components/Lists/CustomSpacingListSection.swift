//
//  CustomSpacingListSection.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/20/24.
//

import SwiftUI

public struct CustomSpacingListSection: ViewModifier {
    let spacing: CGFloat
    
    public func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            content
                .listSectionSpacing(.custom(spacing))
        } else {
            content
        }
    }
}

// MARK: View Extension

public extension View {
    func customListSectionSpacing(_ spacing: CGFloat) -> some View {
        modifier(CustomSpacingListSection(spacing: spacing))
    }
}
