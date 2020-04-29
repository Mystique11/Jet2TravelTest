//
//  Article+CoreDataProperties.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 29/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var articleImage: String?
    @NSManaged public var avatar: String?
    @NSManaged public var comments: Int32
    @NSManaged public var content: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var designation: String?
    @NSManaged public var likes: Int32
    @NSManaged public var userName: String?

}
