//
//  Alarm.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/19/23.
//

import Foundation

struct Alarm: Identifiable {
    let id = UUID()
    let time: Date
    var isActive: Bool
}
