//
//  HomeView.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/23/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: DashboardViewModel
    @EnvironmentObject var alarmViewModel: AlarmsViewModel
    @State var plusTapped = false
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("Alarms")
                        .font(.title)
                    Spacer()
                    Button {
                        plusTapped = true
                    } label: {
                        Image(systemName: "plus")
                    }

                    
                }
                List {
                    ForEach(alarmViewModel.alarms, id: \.time) { alarm in
                        Text("\(alarm.time)")
                    }
                }
            }.padding()
                .navigationTitle("Day Sync")
                
        }.sheet(isPresented: $plusTapped) {
            ContentView()
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
