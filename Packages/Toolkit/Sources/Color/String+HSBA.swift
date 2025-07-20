//
//  String+HSBA.swift
//  Toolkit
//
//  Created by Oscar De Moya on 12/5/24.
//

import Foundation

public extension String {
    var hsba: HSBA? {
        let regex = #/H(?<hue>\d+)\s* S(?<saturation>\d+)\s* B(?<brightness>\d+)/#.ignoresCase().dotMatchesNewlines()
        return matches(of: regex).compactMap { match -> HSBA? in
            guard let hue = Double(match.output.hue) else { return nil }
            guard let saturation = Double(match.output.saturation) else { return nil }
            guard let brightness = Double(match.output.brightness) else { return nil }
            return HSBA(hue: hue, saturation: saturation, brightness: brightness)
        }.first
    }
}
