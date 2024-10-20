//
//  WeatherModel.swift
//  Clima
//
//  Created by Muhammet Emin Kocaman on 19.10.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let contidionID: Int
    let cityName: String
    let temperature: Double
    
    func getConditionName(weatherID : Int ) -> String {
        switch weatherID {
        case 200...232:
            return "cloud.bolt"
        case 300...321 :
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        default:
            return "cloud"
        }
        
    }
}
