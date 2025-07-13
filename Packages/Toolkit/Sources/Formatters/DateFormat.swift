//
//  DateFormat.swift
//  Toolkit
//
//  Created by Oscar De Moya on 11/13/24.
//

import Foundation

public enum DateFormat: String, CaseIterable {
    case iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case iso8601NoMillis = "yyyy-MM-dd'T'HH:mm:ssZ"
    case yearMonthDaySlashed = "yyyy/MM/dd"
    case monthYear = "MMMM yyyy"
    case shortMonthYear = "MMM yyyy"
    case shortMonth = "MMM"
    case fullMonth = "MMMM"
    case year = "yyyy"
    case month = "MM"
    case day = "d"
    case hour = "HH"
    case minute = "mm"
    case hourMinute = "HH:mm"
}
