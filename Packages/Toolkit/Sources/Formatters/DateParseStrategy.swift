//
//  DateParseStrategy.swift
//  Toolkit
//
//  Created by Oscar De Moya on 11/13/24.
//

import Foundation

public extension Date.ParseStrategy {
    static var yearMonthDaySlashed = Self(format: "\(year: .defaultDigits)/\(month: .twoDigits)/\(day: .twoDigits)",
                                          locale: .current, timeZone: .current)
}
