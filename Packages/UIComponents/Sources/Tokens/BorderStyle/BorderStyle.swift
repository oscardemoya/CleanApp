//
//  BorderStyle.swift
//  
//
//  Created by Oscar De Moya on 13/03/24.
//

import Foundation

@MainActor
public enum BorderStyle: @MainActor Identifiable, Hashable, Sendable {
    case none
    case stroke(BorderWidth)
    
    public var id: Self { self }
    
    public static var allCases: [BorderStyle] = [
        .none,
        .stroke(.regular),
        .stroke(.medium),
        .stroke(.large),
        .stroke(.extraLarge)
    ]
}
