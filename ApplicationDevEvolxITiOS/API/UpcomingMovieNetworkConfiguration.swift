//
//  UpcomingMovieNetworkConfiguration.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
enum UpcomingMovieNetworkConfiguration {
    case getUpcomingMovies
}

extension UpcomingMovieNetworkConfiguration: Configuration {
    var baseURL: String { return NetworkingConstant.baseUrl }
    
    var path: String {
        switch self {
        case .getUpcomingMovies:
            return "3/movie/upcoming"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUpcomingMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getUpcomingMovies:
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
