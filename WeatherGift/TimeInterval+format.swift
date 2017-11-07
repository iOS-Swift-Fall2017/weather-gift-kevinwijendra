//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Kevin Wijendra on 11/6/17.
//  Copyright © 2017 Kevin Wijendra. All rights reserved.
//

import Foundation

extension TimeInterval {
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let useableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: useableDate)
        return dateString
    }
}
