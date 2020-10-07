//
//  WeatherModel.swift
//  CarPlayWithAPI
//
//  Created by Bunti Nizama on 31/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherModel: NSObject {
    var speed: String = ""
    var deg : String = ""
    var humidity : String = ""
    var snow : String = ""
    
    var weather : Weather = Weather()
    
    override init() {
        super.init()
    }
    
    func parse(json: JSON) {
        speed = json["speed"].stringValue
        deg = json["deg"].stringValue
        humidity = json["humidity"].stringValue
        snow = json["snow"].stringValue
        
        if let weatherArray = json["weather"].arrayObject {
            if weatherArray.count > 0 {
                weather.parse(json: JSON(weatherArray[0]))
            }
        }
        
    }
    
}

class Weather : NSObject {
   var description1: String = ""
   var main : String = ""
    
    func parse(json: JSON) {
        description1 = json["description"].stringValue
        main = json["main"].stringValue
    }
    
    override init() {
        super.init()
    }
    
}



/*
 {
   "speed" : 4.5700000000000003,
   "deg" : 225,
   "humidity" : 76,
   "snow" : 0.01,
   "pressure" : 1024.53,
   "temp" : {
     "min" : 261.41000000000003,
     "eve" : 262.64999999999998,
     "day" : 262.64999999999998,
     "night" : 261.41000000000003,
     "max" : 262.64999999999998,
     "morn" : 262.64999999999998
   },
   "clouds" : 0,
   "weather" : [
     {
       "description" : "sky is clear",
       "icon" : "01d",
       "id" : 800,
       "main" : "Clear"
     }
   ],
   "dt" : 1485766800
 }
 */
