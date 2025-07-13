//
//  CornerStyle.swift
//
//
//  Created by Oscar De Moya on 13/03/24.
//

import SwiftUI

public enum CornerStyle: Identifiable, Hashable {
    case sharp
    case rounded(CornerRadius)
    case capsule
    case circle
    
    public var id: Self { self }
    
    public static var allCases: [CornerStyle] = [
        .sharp,
        .rounded(.nano),
        .rounded(.small),
        .rounded(.medium),
        .rounded(.large),
        .capsule,
        .circle
    ]
    
    var shape: any InsettableShape {
        switch self {
        case .sharp:
            Rectangle()
        case .rounded(let cornerRadius):
            RoundedRectangle(cornerRadius: cornerRadius.rawValue, style: .continuous)
        case .capsule:
            Capsule()
        case .circle:
            Circle()
        }
    }
    
    func shapeStyle(borderWidth: CGFloat, borderColor: Color) -> any View {
        shape.strokeBorder(borderColor, lineWidth: borderWidth)
    }
}
