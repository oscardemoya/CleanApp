//
//  ColorHierarchy.swift
//  UIComponents
//
//  Created by Oscar De Moya on 9/19/24.
//

import SwiftUI

public extension Hierarchy {
    var brandColor: Color {
        switch self {
        case .primary: .primaryBrand
        case .secondary: .secondaryBrand
        }
    }
    
    var tintColor: Color {
        switch self {
        case .primary: .primaryBrand.opacity(0.3)
        case .secondary: .secondaryBrand.opacity(0.3)
        }
    }
        
    var backgroundColor: Color {
        switch self {
        case .primary: .primaryBackground
        case .secondary: .secondaryBackground
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .primary: .primaryText
        case .secondary: .secondaryText
        }
    }
    
    var inputBackgroundColor: Color {
        switch self {
        case .primary: .tertiaryBackground
        case .secondary: .tertiaryBackground
        }
    }
    
    var inputForegroundColor: Color {
        switch self {
        case .primary: .primaryText
        case .secondary: .secondaryText
        }
    }
}

#Preview {
    @Previewable @State var text: String = ""
    VStack(spacing: .zero) {
        TextField(String("Placeholder"), text: $text).textFieldStyle(.primary)
            .padding()
            .background(.primaryBackground)
        TextField(String("Placeholder"), text: $text).textFieldStyle(.secondary)
            .padding()
            .background(.secondaryBackground)
    }
}
