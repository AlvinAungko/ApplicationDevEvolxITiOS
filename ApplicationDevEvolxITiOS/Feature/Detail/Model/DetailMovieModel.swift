//
//  DetailMovieModel.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

class MovieDetailWatchNowSection {
    var movieID: Int
    var movieImage: String
    var wishListStatus: WishListStatus?
    var movieTitle: String
    
    init(movieID: Int, movieImage: String, wishListStatus: WishListStatus? = nil, movieTitle: String) {
        self.movieID = movieID
        self.movieImage = movieImage
        self.wishListStatus = wishListStatus
        self.movieTitle = movieTitle
    }
}

class MovieDetailDescriptionSection {
    var movieDescription: String
    var releaseDate: String
    
    init(movieDescription: String, releaseDate: String) {
        self.movieDescription = movieDescription
        self.releaseDate = releaseDate
    }
}

class MovieDetailRatingSection {
    var voteCount: String
    var rating: String
    
    init(voteCount: String, rating: String) {
        self.voteCount = voteCount
        self.rating = rating
    }
}

class MovieDetail: Codable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var wishListStatus: WishListStatus?

    var imageUrl: String {
        return "https://image.tmdb.org/t/p/w500"
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    func toMovieDetailWatchNowSection() -> MovieDetailWatchNowSection {
        return MovieDetailWatchNowSection(
            movieID: self.id ?? 0,
            movieImage: "\(self.imageUrl)\(self.backdropPath.orEmpty)",
            wishListStatus: self.wishListStatus ?? .isWishListOff,
            movieTitle: self.title.orEmpty
        )
    }
    
    func toMovieDetailDescriptionSection() -> MovieDetailDescriptionSection {
        return MovieDetailDescriptionSection(movieDescription: self.overview.orEmpty, releaseDate: self.releaseDate.orEmpty)
    }
    
    func toMovieDetailRatingSection() -> MovieDetailRatingSection {
        return MovieDetailRatingSection(voteCount: "\(self.voteCount ?? 0)", rating: "\(self.popularity ?? 0.0)")
    }
}
