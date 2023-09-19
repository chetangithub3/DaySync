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
            Text("Saloni Sunrise time: \(viewModel.sunrise)")
            
            
            Button {
                viewModel.getDaylightDetails()
            } label: {
                Text("Saloni poni")
                    .foregroundColor(Color.white)
                    .padding()
                
                    .background(Color.blue)
                    .cornerRadius(10)
                
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
