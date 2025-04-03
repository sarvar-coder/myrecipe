//
//  FavouriteRecipe+CoreDataProperties.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 03/04/25.
//
//

import Foundation
import CoreData


extension FavouriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteRecipe> {
        return NSFetchRequest<FavouriteRecipe>(entityName: "FavouriteRecipe")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var category: String
    @NSManaged public var country: String
    @NSManaged public var instruction: String
    @NSManaged public var imageURLString: String?
    @NSManaged public var videoURL: String?

}

extension FavouriteRecipe : Identifiable {

}
