//
//  String+RGBA.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import SwiftUI

public extension String {
    var firstHexColor: Color? {
        let bodyRegex = #/(?<hexString>[a-f0-9]{6})/#.ignoresCase().dotMatchesNewlines()
        return matches(of: bodyRegex).compactMap { match -> Color? in
            let hexString = String(match.output.hexString)
            return Color(hex: hexString)
        }.first
    }
}
