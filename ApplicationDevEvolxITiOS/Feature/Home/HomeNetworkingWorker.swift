//
//  HomeNetworkingWorker.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol HomeNetworkingWorkerProtocol {
    func getUpcomingMovies(completion: @escaping (Result<[UpcomingMovieModel], ServiceError>) -> Void)
    func getPopularMovies(completion: @escaping (Result<[PopularMovieModel], ServiceError>) -> Void)
}

class HomeNetworkingWorker: BaseNetworking, HomeNetworkingWorkerProtocol {
    func getUpcomingMovies(completion: @escaping (Result<[UpcomingMovieModel], ServiceError>) -> Void) {
        fetchData(configuration: UpcomingMovieNetworkConfiguration.getUpcomingMovies,
                  responseType: DefaultResponse<[UpcomingMovieModel]>.self) { result in
            switch result {
            case .success(let defaultResponse):
                completion(.success(defaultResponse.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getPopularMovies(completion: @escaping (Result<[PopularMovieModel], ServiceError>) -> Void) {
        fetchData(configuration: PopularMovieNetworkConfiguration.getPopularMovies,
                  responseType: DefaultResponse<[PopularMovieModel]>.self) { result in
            switch result {
            case .success(let defaultResponse):
                completion(.success(defaultResponse.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
