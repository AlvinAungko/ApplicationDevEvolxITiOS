//
//  DatabaseUpdateService.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import Realm

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
    let realmManager: RealmManager
    init(realmManager: RealmManager) {
        self.realmManager = realmManager
    }
    
    func updateMovie(movieStatus: WishListStatus, movieID: Int, movieType: MovieType, completion: @escaping(DBUpdateStatus) -> Void) {
        switch movieType {
        case .upcoming:
            if let movie = realmManager.realm().object(ofType: UpcomingMovieModel.self, forPrimaryKey: movieID) {
                do { try realmManager.realm().write { movie.movieStatus = movieStatus }; completion(.success) }
                catch {completion(.failure)}
            }
        case .popular:
            if let movie = realmManager.realm().object(ofType: PopularMovieModel.self, forPrimaryKey: movieID) {
                do { try realmManager.realm().write { movie.movieStatus = movieStatus }; completion(.success) }
                catch {completion(.failure)}
            }
        }
    }
}
