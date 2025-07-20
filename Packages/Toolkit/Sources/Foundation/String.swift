//
//  File.swift
//  
//
//  Created by Oscar De Moya on 19/05/24.
//

import Foundation
import SwiftUI

public extension String {
    var isBlank: Bool { trimmingCharacters(in: .whitespaces).isEmpty }
    var capitalizingFirstLetter: String { !isEmpty ? prefix(1).capitalized + dropFirst() : "" }

    var jsonObject: Any? {
        guard let data = data(using: .utf8) else { return nil }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return nil }
        return json
    }
    
    var titlecased: String {
        return split(separator: " ").map { (substring) -> String in substring.capitalized }.joined(separator: " ")
    }
    
    var titleCaseFromCamelCase: String {
        let acronymPattern = "([A-Z]+)([A-Z][a-z]|[0-9])"
        let normalPattern = "([a-z0-9])([A-Z])"
        let template = "$1 $2"
        return replacingMatches(usingRegex: acronymPattern, withTemplate: template)?
            .replacingMatches(usingRegex: normalPattern, withTemplate: template)?.titlecased ?? titlecased
    }
    
    var camelCaseFromPascalCase: String {
        return self[startIndex].lowercased() + self[index(after: startIndex)...index(before: endIndex)]
    }
    
    var pascalCaseFromCamelCase: String {
        return self[startIndex].uppercased() + self[index(after: startIndex)...index(before: endIndex)]
    }
    
    func replacingMatches(usingRegex pattern: String, withTemplate template: String) -> String? {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
    }
    
    func fuzzyMatch(_ needle: String) -> Bool {
        if needle.isEmpty { return true }
        var remainder = needle[...].lowercased()
        for char in self.lowercased() where char == remainder[remainder.startIndex] {
            remainder.removeFirst()
            if remainder.isEmpty { return true }
        }
        return false
    }
    
    func filteringNonNumericCharacters(using formatter: NumberFormatter) -> String {
        guard let decimalSeparator = formatter.decimalSeparator else { return self }
        guard let groupingSeparator = formatter.groupingSeparator else { return self }
        let allowedCharacters = CharacterSet(charactersIn: "0123456789\(decimalSeparator)")
        return self.trimmingCharacters(in: allowedCharacters.inverted).replacing(groupingSeparator, with: "")
    }
}
