//
//  MovieDetailNetworkConfiguration.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

enum MovieDetailNetworkConfiguration {
    case getMovieDetail(String)
}

extension MovieDetailNetworkConfiguration: Configuration {
    var baseURL: String { return NetworkingConstant.baseUrl }
    
    var path: String {
        switch self {
        case .getMovieDetail(let movieID):
            return "3/movie/\(movieID)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovieDetail(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMovieDetail(_):
            return .requestParameters(parameters: [
                "api_key": NetworkingConstant.apiKey,
                "language": NetworkingConstant.language,
                "page": 1
            ])
        }
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            return ["Authorization": "Bearer \(NetworkingConstant.accessToken)"]
        }
    }
    
    var data: Data? {
        return nil
    }
}
