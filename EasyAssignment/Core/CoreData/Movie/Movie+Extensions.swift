//
//  Movie+Extensions.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import SwiftyJSON
import Foundation

extension Movie: NSManagedObjectProtocol {
    
}

extension Movie {
    // ================================= //
    // MARK: - Initialize Objects Method //
    // ================================= //
    @discardableResult static func initialize(array jsonArray: [JSON]) -> [Movie] {
        jsonArray.forEach { Movie.initialize($0) }
        return all
    }
}

extension Movie {
    // ================================ //
    // MARK: - Initialize Object Method //
    // ================================ //
    @discardableResult static func initialize(_ json: JSON) -> Movie {
        return Movie.Builder(json["id"].stringValue)
            .set(id: json["id"].numberValue)
            .set(adult: json["adult"].boolValue)
            .set(video: json["video"].boolValue)
            .set(title: json["title"].stringValue)
            .set(overview: json["overview"].stringValue)
            .set(voteCount: json["vote_count"].numberValue)
            .set(popularity: json["popularity"].doubleValue)
            .set(posterPath: json["poster_path"].stringValue)
            .set(voteAverage: json["vote_average"].doubleValue)
            .set(releaseDate: json["release_date"].stringValue)
            .set(backdropPath: json["backdrop_path"].stringValue)
            .set(originalTitle: json["original_title"].stringValue)
            .set(originalLanguage: json["original_language"].stringValue)
            .save()
    }
}
