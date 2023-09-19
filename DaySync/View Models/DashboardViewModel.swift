//
//  DashboardViewModel.swift
//  DaySync
//
//  Created by Chetan Dhowlaghar on 9/16/23.
//

import Foundation
import SwiftUI
import Combine

class DashboardViewModel: ObservableObject {
    
    @Published var sunrise = ""
    @Published var sunset = ""
    @ObservedObject var locationManager: LocationManager
    
    init() {
        locationManager = LocationManager()
    }
    
    
    func getDaylightDetails(){
        guard let lat = locationManager.exposedLocation?.coordinate.latitude.magnitude, let lon = locationManager.exposedLocation?.coordinate.longitude.magnitude else {
            return
        }
        var url = Constants.API.baseURL.rawValue + "?lat=\(lat)" + "&lon=\(lon)"
        fetchData(from: URL(string: url)!)
        
    }
    
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
                self.sunrise = daylightData.results?.sunrise ?? ""
                self.sunset = daylightData.results?.sunset ?? ""
                
            })
            
    }
    
    
}
