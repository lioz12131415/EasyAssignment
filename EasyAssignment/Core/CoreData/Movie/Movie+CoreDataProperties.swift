//
//  Movie+CoreDataProperties.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var id:        Int32
    @NSManaged public var voteCount: Int32
    
    @NSManaged public var adult: Bool
    @NSManaged public var video: Bool
    
    @NSManaged public var title:            String?
    @NSManaged public var overview:         String?
    @NSManaged public var posterPath:       String?
    @NSManaged public var releaseDate:      String?
    @NSManaged public var backdropPath:     String?
    @NSManaged public var originalTitle:    String?
    @NSManaged public var originalLanguage: String?
        
    @NSManaged public var popularity:  Double
    @NSManaged public var voteAverage: Double
}

extension Movie : Identifiable {

}
