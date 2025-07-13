//
//  DateFormatter.swift
//
//
//  Created by Oscar De Moya on 21/05/24.
//

import Foundation

public extension Date {
    static var today: Date { Calendar.current.startOfDay(for: .now) }
    var startOfYear: Date { startOf(.year) }
    var startOfQuarter: Date { startOf(.quarter) }
    var startOfMonth: Date { startOf(.month) }
    var startOfDay: Date { startOf(.day) }
    
    func startOf(_ component: Calendar.Component) -> Date {
        Calendar.current.dateInterval(of: component, for: self)?.start ?? self
    }
    
    var endOfMonth: Date {
        let calendar = Calendar.current
        guard let range = calendar.range(of: .day, in: .month, for: self), let day = range.last else { return self }
        var components = calendar.dateComponents([.year, .month], from: self)
        components.day = day
        return calendar.date(from: components) ?? self
    }
    
    var endOfHalfMonth: Date {
        let date = Calendar.current.startOfDay(for: self)
        let components = Calendar.current.dateComponents([.day], from: date)
        guard let day = components.day else { return self }
        if day < 15 {
            return Calendar.current.date(bySetting: .day, value: 14, of: self) ?? self
        } else {
            return endOfMonth
        }
    }
    
    var isToday: Bool { Calendar.current.isDateInToday(self) }
    var isTomorrow: Bool { Calendar.current.isDateInTomorrow(self) }
    var isYesterday: Bool { Calendar.current.isDateInYesterday(self) }
    var isThisYear: Bool { Calendar.current.isDate(self, equalTo: Date(), toGranularity: .year) }
    
    var relativeString: String {
        if isToday { return String(localized: "Today", bundle: .module) }
        if isTomorrow { return String(localized: "Tomorrow", bundle: .module) }
        if isYesterday { return String(localized: "Yesterday", bundle: .module) }
        let formatter = RelativeDateTimeFormatter()
        let components = Calendar.current.dateComponents([.year, .month, .day], from: .today, to: self)
        return formatter.localizedString(from: components)
    }
    
    var mediumDateString: String { string(dateStyle: .medium, timeStyle: .none) }
    var shortDateString: String { string(dateStyle: .short, timeStyle: .none) }
    var shortTimeString: String { string(dateStyle: .none, timeStyle: .short) }
    
    func string(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }
    
    var iso8601String: String { string(withFormat: .iso8601) }
    var yearMonthDaySlashedString: String { string(withFormat: .yearMonthDaySlashed) }
    var shortMonthString: String { string(withFormat: .shortMonth) }
    var shortMonthYearString: String { string(withFormat: .shortMonthYear) }
    var fullMonthString: String { string(withFormat: .fullMonth) }
    var yearString: String { string(withFormat: .year) }
    var monthOfYearString: String { string(withFormat: .monthYear) }
    var hourMinuteString: String { string(withFormat: .hourMinute) }
    
    func string(withFormat dateFormat: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: self).capitalized
    }
    
    var year: Int { value(for: .year) }
    var month: Int { value(for: .month) }
    var day: Int { value(for: .day) }
    var hour: Int { value(for: .hour) }
    var minute: Int { value(for: .minute) }
    var second: Int { value(for: .second) }
    
    func value(for component: Calendar.Component) -> Int {
        Calendar.current.component(component, from: self)
    }
}
