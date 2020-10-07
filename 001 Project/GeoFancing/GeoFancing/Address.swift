
//
//  File.swift
//  GeoFancing
//
//  Created by Bunti Nizama on 26/08/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//


import Foundation
import SwiftyJSON

class Address: NSObject {

    var datasetid  : String = ""
    var address : String = ""
    var postalCode : String = "" //n_sq_ar
    var lattitude : Double = 0
    var longitude : Double = 0
    
    func parceData(json : JSON) {
        datasetid = json["datasetid"].stringValue
        address = JSON(json["fields"])["l_adr"].stringValue
        postalCode = JSON(json["fields"])["n_sq_ar"].stringValue
        if JSON(json["fields"])["geom_x_y"].arrayValue.count > 1 {
            lattitude = JSON(json["fields"])["geom_x_y"].arrayValue[0].doubleValue
            longitude = JSON(json["fields"])["geom_x_y"].arrayValue[1].doubleValue
        }
    }
    
    override init() {
        super.init()
    }
  
}

