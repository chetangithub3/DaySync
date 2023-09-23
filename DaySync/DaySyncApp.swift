//
//  DaySyncApp.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import SwiftUI

@main
struct DaySyncApp: App {
    @StateObject var viewModel = DashboardViewModel()
    @StateObject var alarmViewModel = AlarmsViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(alarmViewModel)
        }
    }
}
