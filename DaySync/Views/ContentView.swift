//
//  ContentView.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @AppStorage("sleepTime") var sleepTime = 8
    @State private var selectedTime = Date()
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack {
            DatePicker(
                            "Date",
                            selection: $selectedDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(CompactDatePickerStyle())
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Sunrise time: \(viewModel.sunrise)")
            Text("Sunset time: \(viewModel.sunset)")
            
            DatePicker("Select a time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                           .labelsHidden()
                           .datePickerStyle(WheelDatePickerStyle())
                           .environment(\.locale, Locale(identifier: "en_US")
                                         )

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
