//
//  Utility.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import Foundation

extension Date {
    var timeFormatter: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

func getTimeFromDate(date: Date) -> String {
    let result = getTimeComponents(date: date)
    let hour = result.hour
    let minute = result.minute
    
    let time = String(format: "%02d:%02d", hour, minute)
    
    return time
}

func addHourToDate(date: Date, numHours: Int, numMinutes: Int) -> Date {
    date.addingTimeInterval(
        TimeInterval(numMinutes * 60 + numHours * 60 * 60)
    )
}

func getTimeComponents(date: Date) -> (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
    let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
    let hour = components.hour ?? 0
    let minute = components.minute ?? 0
    let year = components.year ?? 0
    let month = components.month ?? 0
    let second = components.second ?? 0
    let day = components.day ?? 0
    
    return (year, month, day, hour, minute, second)
}

func dateToPercent(date: Date) -> CGFloat {
    let date = getTimeComponents(date: date)
    
    return CGFloat(date.hour) / 24 + CGFloat(date.minute) / (60 * 24)
}


func formatDate(date: Date) -> String {
    let result = getTimeComponents(date: date)
    
    return "\(result.day)-\(result.minute)-\(result.year)(\(result.hour):\(result.minute)"
}

func DateToTimeModel(date: Date) -> TimeModel {
    let result = getTimeComponents(date: date)
    
    return TimeModel(hours: result.hour, minutes: result.minute)
}
