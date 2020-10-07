//
//  DataModel.swift
//  001_Api_SwiftUI
//
//  Created by Bunti Nizama on 22/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataModel : NSObject,Identifiable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let contact_name = "contact_name"
        static let address_street = "address_street"
        static let id = "id"
        static let date_end = "date_end"
        static let category = "category"
        static let title = "title"
        static let date_start = "date_start"
        static let address_name = "address_name"
        static let contact_phone = "contact_phone"
        static let description = "description"
        static let contact_twitter = "contact_twitter"
        static let contact_url = "contact_url"
        static let access_link = "access_link"
        static let tags = "tags"
        static let contact_mail = "contact_mail"
        static let contact_facebook = "contact_facebook"
        static let access_phone = "access_phone"
        static let address_city = "address_city"
        static let programs = "programs"
        static let transport = "transport"
        static let address_zipcode = "address_zipcode"
        static let date_description = "date_description"
    }
    
    // MARK: Properties
    
     var  contact_name : String = ""
     var  address_street : String  = ""
     var  id : String  = ""
     var  date_end : String  = ""
     var  category : String  = ""
     var  title : String  = ""
     var  date_start : String  = ""
     var  address_name : String  = ""
     var  contact_phone : String  = ""
     var  description1 : String  = ""
     var  contact_twitter : String  = ""
     var  contact_url : String  = ""
     var  access_link : String  = ""
     var  tags : String  = ""
     var  contact_mail : String  = ""
     var  contact_facebook : String  = ""
     var  access_phone : String  = ""
     var  address_city : String  = ""
     var  programs : String  = ""
     var  transport : String  = ""
     var  address_zipcode : String  = ""
     var  date_description : String  = ""
     var lattitude : Double = 0
     var longitude : Double = 0
    
    func parseData(object: Any) {
        self.parseData(json: JSON(object))
    }
    
    func parseData(json: JSON) {
        contact_name =  json[SerializationKeys.contact_name].stringValue
        address_street =  json[SerializationKeys.address_street].stringValue
        id =  json[SerializationKeys.id].stringValue
        date_end =  json[SerializationKeys.date_end].stringValue
        category =  json[SerializationKeys.category].stringValue
        title =  json[SerializationKeys.title].stringValue
        date_start =  json[SerializationKeys.date_start].stringValue
        address_name =  json[SerializationKeys.address_name].stringValue
        contact_phone =  json[SerializationKeys.contact_phone].stringValue
        description1 =  json[SerializationKeys.description].stringValue
        contact_twitter =  json[SerializationKeys.contact_twitter].stringValue
        contact_url =  json[SerializationKeys.contact_url].stringValue
        access_link =  json[SerializationKeys.access_link].stringValue
        tags =  json[SerializationKeys.tags].stringValue
        contact_mail =  json[SerializationKeys.contact_mail].stringValue
        contact_facebook =  json[SerializationKeys.contact_facebook].stringValue
        access_phone =  json[SerializationKeys.access_phone].stringValue
        address_city =  json[SerializationKeys.address_city].stringValue
        programs =  json[SerializationKeys.programs].stringValue
        transport =  json[SerializationKeys.transport].stringValue
        address_zipcode =  json[SerializationKeys.address_zipcode].stringValue
        date_description =  json[SerializationKeys.date_description].stringValue
        if let latArray = json["lat_lon"].arrayObject {
            if latArray.count == 2 {
                lattitude = JSON(latArray[0]).doubleValue
                longitude = JSON(latArray[1]).doubleValue
            }
        }
    }
    
    class func parseData(dataArray1 : [[String : Any]]) -> [DataModel] {
        var dataArray = [DataModel]()
        for tableRow in  dataArray1 {
            let tableRowJson = JSON(tableRow["fields"])
            if tableRowJson == JSON.null {
                continue
            }
            let data = DataModel()
            data.parseData(json: tableRowJson)
            dataArray.append(data)
        }
        return dataArray
    }
    
    static func stringToJsonObject(stringData: String) -> [[String : Any]] {
           let data = stringData.data(using: .utf8)!
           do {
               if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [[String : Any]]
               {
                   return jsonArray
                   //               print(jsonArray) // use the json here
               } else {
                   print("bad json")
                   return [[String : Any]]()
               }
           } catch let error as NSError {
               print(error)
               return [[String : Any]]()
           }
       }
}

