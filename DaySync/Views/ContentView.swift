//
//  ContentView.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = DashboardViewModel()
    @State var title = "Hello, world!"
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Sunrise time: \(viewModel.sunrise)")
            Text("Sunset time: \(viewModel.sunset)")

        }
        .padding()
        .onAppear {
            viewModel.getDaylightDetails()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
