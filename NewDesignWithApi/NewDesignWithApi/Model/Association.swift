//
//  Association.swift
//  NewDesignWithApi
//
//  Created by Bunti Nizama on 08/07/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import Foundation
import SwiftyJSON

class Association: NSObject {
    
    struct SerializationKeys {
        static let id_association = "id_association"
        static let titre = "titre"
        static let date_creation = "date_creation"
        static let adresse_type_voie = "l2_adresse_import"
        static let adresse_libelle_voie = "date_creation"

    }
    
    var id_association : String = ""
    var titre : String = ""
    var date_creation : String = ""
    var adresse_type_voie : String = ""
    var adresse_libelle_voie : String = ""
    
    
    func parceData(json : JSON) {
        id_association = json[SerializationKeys.id_association].stringValue
        titre = json[SerializationKeys.titre].stringValue
        date_creation = json[SerializationKeys.date_creation].stringValue
        adresse_type_voie = json[SerializationKeys.adresse_type_voie].stringValue
        adresse_libelle_voie = json[SerializationKeys.adresse_libelle_voie].stringValue
    }
    
    override init() {
        super.init()
    }
  
}
