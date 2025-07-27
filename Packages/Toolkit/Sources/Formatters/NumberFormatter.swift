//
//  NumberFormatter.swift
//
//
//  Created by Oscar De Moya on 19/05/24.
//

import Foundation

public extension NumberFormatter {
    static func currency(decimalSeparator: Separator) -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyDecimalSeparator = decimalSeparator.rawValue
        formatter.currencyGroupingSeparator = decimalSeparator.groupingSeparator.rawValue
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.isLenient = true
        return formatter
    }
    
    static let currency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.isLenient = true
        return formatter
    }()
    
    static let optionalCurrency: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.isLenient = true
        formatter.roundingMode = .down
        formatter.zeroSymbol = ""
        return formatter
    }()
}

public extension Double {
    var asCurrency: String {
        let number = NSNumber(value: self)
        return NumberFormatter.currency.string(from: number) ?? ""
    }
    
    var asOptionalCurrency: String {
        let number = NSNumber(value: self)
        return NumberFormatter.optionalCurrency.string(from: number) ?? ""
    }
}

public enum Separator: String, CaseIterable {
    case dot = "."
    case comma = ","
    
    var groupingSeparator: Separator {
        switch self {
        case .dot: .comma
        case .comma: .dot
        }
    }
}
