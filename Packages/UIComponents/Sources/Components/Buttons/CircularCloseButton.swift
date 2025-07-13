//
//  CircularCloseButton.swift
//  UIComponents
//
//  Created by Oscar De Moya on 18/05/24.
//

import SwiftUI
import Toolkit

public struct CircularCloseButton: View {
    public enum Size {
        case compact
        case regular
        case large
        
        var isCompact: Bool { self == .compact }
        var isRegular: Bool { self == .regular }
        var isLarge: Bool { self == .large }
        
        var fontSize: CGFloat {
            switch self {
            case .compact: return 16
            case .regular: return 20
            case .large: return 32
            }
        }
        
        var horizontalPadding: Padding {
            switch self {
            case .compact: return .nano
            case .regular: return .extraSmall
            case .large: return .small
            }
        }
        
        var verticalPadding: Padding {
            switch self {
            case .compact: return .zero
            case .regular: return .extraSmall
            case .large: return .small
            }
        }
    }

    public init(size: Size = .regular, action: @escaping Action) {
        self.size = size
        self.action = action
    }
    
    public var size: Size = .regular
    public var action: Action

    public var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.tertiaryBackground, .secondaryText)
                .textStyle(.headline)
                .padding(.horizontal, size.horizontalPadding)
                .padding(.vertical, size.verticalPadding)
        }
        .foregroundColor(.tertiaryText)
    }
}

#Preview {
    CircularCloseButton {}
}
