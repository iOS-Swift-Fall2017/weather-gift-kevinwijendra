//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Kevin Wijendra on 10/24/17.
//  Copyright © 2017 Kevin Wijendra. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var dailySummary = ""
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return a temperature.")
                }
                if let weatherSummary = json["daily"]["summary"].string {
                    self.dailySummary = weatherSummary
                } else {
                    print("Could not return a summary.")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("Could not return an icon.")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
