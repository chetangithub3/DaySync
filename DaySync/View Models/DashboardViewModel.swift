//
//  DashboardViewModel.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import Foundation
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var sunrise = "Hello selpuu"
    
    func fetchData(from url: URL) {
        APIManager.publisher(for: url)
            .sink (receiveCompletion: { (completion) in
                switch completion {
                    case .finished:
                        return
                    case .failure(let error):
                        print(error.localizedDescription)
                       
                        
                }
            }, receiveValue: { (daylightData: DaylightData) in
                

                
                
                
            })
            
    }
    
    
}
