//
//  Post+CoreDataProperties.swift
//  
//
//  Created by Tomokatsu Iguchi on 2018/06/24.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var id: Int32
    @NSManaged public var imageUrl: String?
    @NSManaged public var thumbImageUrl: String?
    @NSManaged public var title: String?

}
