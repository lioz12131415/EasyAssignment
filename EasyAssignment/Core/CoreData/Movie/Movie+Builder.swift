//
//  Movie+Builder.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension Movie {
    // =============================================== //
    // MARK: - Object Builder Class
    // =============================================== //
    internal class Builder {
        
        private var movie: Movie
        
        init(_ id: String) {
            self.movie = Movie.fetch(where: \.id, equalTo: id) ?? .new
        }
        
        init(_ movie: Movie? = nil) {
            self.movie = movie ?? .new
        }
        
        @discardableResult internal func set(adult: Bool) -> Self {
            movie.adult = adult
            return self
        }
        
        @discardableResult internal func set(video: Bool) -> Self {
            movie.video = video
            return self
        }
        
        @discardableResult internal func set(id: NSNumber) -> Self {
            movie.id = id.int32Value
            return self
        }
        
        @discardableResult internal func set(voteCount: NSNumber) -> Self {
            movie.voteCount = voteCount.int32Value
            return self
        }
        
        @discardableResult internal func set(title: String) -> Self {
            movie.title = title
            return self
        }
        
        @discardableResult internal func set(overview: String) -> Self {
            movie.overview = overview
            return self
        }
        
        @discardableResult internal func set(posterPath: String) -> Self {
            movie.posterPath = posterPath
            return self
        }
        
        @discardableResult internal func set(releaseDate: String) -> Self {
            movie.releaseDate = releaseDate
            return self
        }
        
        @discardableResult internal func set(backdropPath: String) -> Self {
            movie.backdropPath = backdropPath
            return self
        }
        
        @discardableResult internal func set(originalTitle: String) -> Self {
            movie.originalTitle = originalTitle
            return self
        }
        
        @discardableResult internal func set(originalLanguage: String) -> Self {
            movie.originalLanguage = originalLanguage
            return self
        }
        
        @discardableResult internal func set(popularity: Double) -> Self {
            movie.popularity = popularity
            return self
        }
        
        @discardableResult internal func set(voteAverage: Double) -> Self {
            movie.voteAverage = voteAverage
            return self
        }
        
        @discardableResult func save() -> Movie {
            CoreDataManeger.saveContext()
            return movie
        }
    }
}

