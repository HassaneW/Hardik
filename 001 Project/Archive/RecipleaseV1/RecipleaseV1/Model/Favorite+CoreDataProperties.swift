//
//  Favorite+CoreDataProperties.swift
//  
//
//  Created by Bunti Nizama on 18/09/20.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var title: String?
    @NSManaged public var imageUrl: String?
    @NSManaged public var url: String?
    @NSManaged public var portions: Int32
    @NSManaged public var ingredients: String?
    @NSManaged public var totalTime: Int64

}
