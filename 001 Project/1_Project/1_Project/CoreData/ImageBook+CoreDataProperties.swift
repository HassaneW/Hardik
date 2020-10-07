//
//  ImageBook+CoreDataProperties.swift
//  
//
//  Created by Bunti Nizama on 29/08/20.
//
//

import Foundation
import CoreData


extension ImageBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageBook> {
        return NSFetchRequest<ImageBook>(entityName: "ImageBook")
    }

    @NSManaged public var descriptionOfImage: String?
    @NSManaged public var id: UUID
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    
    
    
   
}
