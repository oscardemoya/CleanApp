//
//  ImageButton.swift
//  UIComponents
//
//  Created by Oscar De Moya on 21/05/24.
//

import SwiftUI
import Toolkit

public struct ImageButton: View {
    public enum Size {
        case compact
        case regular
        case large
        
        var fontSize: CGFloat {
            switch self {
            case .compact: return 16
            case .regular: return 20
            case .large: return 30
            }
        }
        
        var minWidth: CGFloat {
            switch self {
            case .compact: return 24
            case .regular: return 32
            case .large: return 48
            }
        }
        
        var maxHeight: CGFloat {
            switch self {
            case .compact: return 16
            case .regular: return 24
            case .large: return 32
            }
        }
        
        var horizontalPadding: CGFloat {
            switch self {
            case .compact: return 0
            case .regular: return 0
            case .large: return 0
            }
        }
        
        var verticalPadding: CGFloat {
            switch self {
            case .compact: return 8
            case .regular: return 8
            case .large: return 12
            }
        }
        
        var cornerRadius: CornerRadius {
            switch self {
            case .compact: return .small
            case .regular: return .medium
            case .large: return .medium
            }
        }
    }
    
    var systemName: String
    @State var color: Color = .accentBrand
    var size: Size = .regular
    var action: Action

    public init(
        systemName: String,
        color: Color = .accentBrand,
        size: Size = .regular,
        action: @escaping Action
    ) {
        self.systemName = systemName
        self.color = color
        self.size = size
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: systemName)
                    .font(.system(size: size.fontSize, weight: .regular))
                    .frame(minWidth: size.minWidth, maxHeight: size.maxHeight)
                    .padding(.horizontal, size.horizontalPadding)
                    .padding(.vertical, size.verticalPadding)
            }
        }
        .tint(color)
        .cornerStyle(.rounded(size.cornerRadius))
    }
}

#Preview {
    VStack {
        ImageButton(systemName: "star", size: .compact) {}
        ImageButton(systemName: "star", size: .regular) {}
        ImageButton(systemName: "star", size: .large) {}
    }
    .buttonStyle(.borderedProminent)
}
