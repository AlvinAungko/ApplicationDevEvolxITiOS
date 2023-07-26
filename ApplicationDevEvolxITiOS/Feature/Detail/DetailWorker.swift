//
//  DetailWorker.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol DetailWorkerProtocol {
    func getMovieDetail(movieID: Int, completion: @escaping (Result<MovieDetail, ServiceError>) -> Void)
}

class DetailWorker: BaseNetworking, DetailWorkerProtocol {
    func getMovieDetail(movieID: Int,completion: @escaping (Result<MovieDetail, ServiceError>) -> Void) {
        fetchData(configuration: MovieDetailNetworkConfiguration.getMovieDetail("\(movieID)"),
                  responseType: MovieDetail.self) { result in
            switch result {
            case .success(let defaultResponse):
                completion(.success(defaultResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
