//
//  Constants.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit

class Constants: NSObject {
  
    
}
enum DataError: Error {
    case dataError
}
let articleURL = "https://5e99a9b1bc561b0016af3540.mockapi.io/jet2/api/v1/blogs?page=1&limit=10"


extension Int32 {
    func shorted() -> String {
        if self >= 1000 && self < 10000 {
            return String(format: "%.1fK", Double(self/100)/10).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 10000 && self < 1000000 {
            return "\(self/1000)k"
        }
        
        if self >= 1000000 && self < 10000000 {
            return String(format: "%.1fM", Double(self/100000)/10).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 10000000 {
            return "\(self/1000000)M"
        }
        
        return String(self)
    }
}

extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{

        let dateFormatter = DateFormatter()

        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func toString(withFormat format: String = "EEEE ، d MMMM yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}

extension Date {
    /// Returns the amount of years from another date
func years(from date: Date) -> Int {
    return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
}
/// Returns the amount of months from another date
func months(from date: Date) -> Int {
    return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
}
/// Returns the amount of weeks from another date
func weeks(from date: Date) -> Int {
    return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
}
/// Returns the amount of days from another date
func days(from date: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
}
/// Returns the amount of hours from another date
func hours(from date: Date) -> Int {
    return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
}
/// Returns the amount of minutes from another date
func minutes(from date: Date) -> Int {
    return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
}
/// Returns the amount of seconds from another date
func seconds(from date: Date) -> Int {
    return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
}
/// Returns the amount of nanoseconds from another date
func nanoseconds(from date: Date) -> Int {
    return Calendar.current.dateComponents([.nanosecond], from: date, to: self).nanosecond ?? 0
}
/// Returns the a custom time interval description from another date
func offset(from date: Date) -> String {
    var result: String = ""
            if years(from: date)   > 0 { return "\(years(from: date))y"   }
            if months(from: date)  > 0 { return "\(months(from: date))M"  }
            if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
    if seconds(from: date) > 0 { return "\(seconds(from: date))" }
            if days(from: date)    > 0 { result = result + " " + "\(days(from: date)) D" }
            if hours(from: date)   > 0 { result = result + " " + "\(hours(from: date)) H" }
            if minutes(from: date) > 0 { result = result + " " + "\(minutes(from: date)) M" }
           if seconds(from: date) > 0 { return "\(seconds(from: date))" }
    return ""
 }
}
