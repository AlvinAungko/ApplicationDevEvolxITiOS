//
//  PopularMovieNetworkConfiguration.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

enum PopularMovieNetworkConfiguration {
    case getPopularMovies
}

extension PopularMovieNetworkConfiguration: Configuration {
    var baseURL: String { return NetworkingConstant.baseUrl }
    
    var path: String {
        switch self {
        case .getPopularMovies:
            return "3/movie/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPopularMovies:
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
