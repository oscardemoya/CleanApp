//
//  FontResource.swift
//  DesignSystem
//
//  Created by Oscar De Moya on 2025/7/20.
//

import Foundation

public protocol FontResource {
    var fileNames: [String] { get }
}

public extension FontResource {
    func register() {
        FontLoader.registerFonts(fontNames: fileNames)
    }
}
