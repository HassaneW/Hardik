//
//  realMFirstTable.swift
//  FirstProject
//
//  Created by Bunti Nizama on 10/06/20.
//  Copyright © 2020 Allianz Cloud. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift


class realMFirstTable: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var name :String = ""
    
    
    func setValue(nameStr:String){
        name = nameStr
    }
    
    
}


