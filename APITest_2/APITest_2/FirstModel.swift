//
//  FirstModel.swift
//  APITest_2
//
//  Created by Wandianga on 05/06/2020.
//  Copyright © 2020 Wandianga. All rights reserved.
//

import Foundation
import SwiftyJSON


class FirstModel: NSObject {
    var name: String = ""
    var id : Double = 0.0
    var dt : Double = 0.0
    var base : String = ""
    
    override init() {
        super.init()
    }
    
    func parse(json: JSON) {
        name = json["name"].stringValue
        id = json["id"].doubleValue
        dt = json["dt"].doubleValue
        base = json["base"].stringValue
        
    }
    
}

