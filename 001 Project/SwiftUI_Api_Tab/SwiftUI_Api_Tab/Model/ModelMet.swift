//
//  ModelMet.swift
//  SwiftUI_Api_Tab
//
//  Created by Bunti Nizama on 03/09/20.
//  Copyright © 2020 Bunti Nizama. All rights reserved.
//
import Foundation  // MARK: - Met
struct ModelMet: Codable{
    let departments: [Department]
}
// MARK: -Department
struct Department: Codable ,Identifiable{
    var id = UUID()
    let departmentID:Int
    let displayName:String
    enum CodingKeys: String, CodingKey {
        case departmentID = "departmentId"
        case displayName
    }
}


//struct Person: Identifiable {
//    var id = UUID()
//    var name : String
//    
//   
//    static let mock: [Person] = [
//        Person(name: "Miller", image: UIImage(named: "Art1" )!),
//        Person(name: "Smart", image: UIImage(named: "Art2" )!),
//        Person(name: "Bain", image: UIImage(named: "Art3" )!),
//        Person(name: "velez", image: UIImage(named: "Art4" )!),
//    ]
//    
//    
//    init( name: String , image : UIImage) {
//
//        self.name = name
//        self.image = image
//    }
//}
