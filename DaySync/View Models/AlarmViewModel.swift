    //
    //  AlarmViewModel.swift
    //  DaySync
    //
    //  Created by Chetan Dhowlaghar on 9/19/23.
    //

import Foundation
import SwiftUI
import Combine

class AlarmsViewModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    func addAlarm(time: Date) {
        let newAlarm = Alarm(time: time, isActive: true)
        alarms.append(newAlarm)
    }
    
    func deleteAlarm(at offsets: IndexSet) {
        alarms.remove(atOffsets: offsets)
    }
    
    func toggleAlarm(at index: Int) {
        alarms[index].isActive.toggle()
    }
}
