//
//  HomeModel.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

class UpcomingMovieModel: Object, Decodable {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var title: String
    @Persisted var overview: String
    @Persisted var voteAverage: Float
    @Persisted var posterPath: String?
    @Persisted var backdropPath: String?
    @Persisted var movieStatus: WishListStatus? = .isWishListOff
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

class PopularMovieModel: Object, Decodable {
    @Persisted(primaryKey: true) var id: Int = 0
    @Persisted var title: String
    @Persisted var overview: String
    @Persisted var voteAverage: Float
    @Persisted var posterPath: String?
    @Persisted var backdropPath: String?
    @Persisted var movieStatus: WishListStatus? = .isWishListOff
    
    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}
