//
//  EventData+CoreDataProperties.swift
//  
//
//  Created by Bunti Nizama on 25/09/20.
//
//

import Foundation
import CoreData


extension EventData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventData> {
        return NSFetchRequest<EventData>(entityName: "EventData")
    }

    @NSManaged public var contact_name: String?
    @NSManaged public var address_street: String?
    @NSManaged public var id: String?
    @NSManaged public var date_end: String?
    @NSManaged public var category: String?
    @NSManaged public var title: String?
    @NSManaged public var date_start: String?
    @NSManaged public var address_name: String?
    @NSManaged public var contact_phone: String?
    @NSManaged public var description1: String?
    @NSManaged public var contact_twitter: String?
    @NSManaged public var contact_url: String?
    @NSManaged public var access_link: String?
    @NSManaged public var tags: String?
    @NSManaged public var contact_mail: String?
    @NSManaged public var contact_facebook: String?
    @NSManaged public var access_phone: String?
    @NSManaged public var address_city: String?
    @NSManaged public var programs: String?
    @NSManaged public var transport: String?
    @NSManaged public var address_zipcode: String?
    @NSManaged public var date_description: String?
    @NSManaged public var lattitude: Double
    @NSManaged public var longitude: Double


}
