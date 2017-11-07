//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Kevin Wijendra on 11/6/17.
//  Copyright © 2017 Kevin Wijendra. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
