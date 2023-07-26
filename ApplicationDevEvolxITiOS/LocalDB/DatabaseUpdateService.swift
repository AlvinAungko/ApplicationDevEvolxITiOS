//
//  DatabaseUpdateService.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

enum DBUpdateStatus {
    case failure
    case success
    var statusMessage: String {
        switch self {
        case .failure:
            return "Update Process Failed!"
        case .success:
            return "Update Process succeeds!"
        }
    }
}

class DataUpdateService {
    let realmManager: Realm
    init(realmManager: Realm) {
        self.realmManager = realmManager
    }
    
    func updateMovie(movieStatus: WishListStatus, movieID: Int, movieType: MovieType, completion: @escaping(DBUpdateStatus) -> Void) {
        switch movieType {
        case .upcoming:
            if let movie = realmManager.object(ofType: UpcomingMovieModel.self, forPrimaryKey: movieID) {
                do { try realmManager.write { movie.movieStatus = movieStatus }; completion(.success) }
                catch {completion(.failure)}
            }
        case .popular:
            if let movie = realmManager.object(ofType: PopularMovieModel.self, forPrimaryKey: movieID) {
                do { try realmManager.write { movie.movieStatus = movieStatus }; completion(.success) }
                catch {completion(.failure)}
            }
        }
    }
}
