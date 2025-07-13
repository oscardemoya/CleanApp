//
//  File.swift
//  Toolkit
//
//  Created by Oscar De Moya on 11/13/24.
//

import Foundation

public extension String {
    var iso8601Date: Date? { date(format: .iso8601) }
    var hourMinuteDate: Date? { date(format: .hourMinute) }
    
    func date(format: DateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter.date(from: self)
    }
}
