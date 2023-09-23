    //
    //  ContentView.swift
    //  DaySync
    //
    //  Created by Chetan Dhowlaghar on 9/16/23.
    //

import SwiftUI
import UserNotifications

struct ContentView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @ObservedObject var alarmViewModel = AlarmsViewModel()
    @AppStorage("sleepTime") var sleepTime = 8
    @State private var selectedTime = Date()
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Sunrise time: \(viewModel.sunrise)")
            Text("Sunset time: \(viewModel.sunset)")
            DatePicker(
                "Date",
                selection: $selectedDate,
                displayedComponents: .date
            )
            .datePickerStyle(CompactDatePickerStyle())

                .foregroundColor(.accentColor)
           
            
            DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .environment(\.locale, Locale(identifier: "en_US")
                )
            
            Button {
                if selectedTime > Date() {
                    alarmViewModel.addAlarm(time: selectedTime)
                } else {
                    print("Error")
                }
            } label: {
                Text("Save")
            }

        }
        .padding()
        .onAppear {
            viewModel.getDaylightDetails(for: selectedDate)
        }
        .onChange(of: selectedDate) { _ in
            viewModel.getDaylightDetails(for: selectedDate)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
