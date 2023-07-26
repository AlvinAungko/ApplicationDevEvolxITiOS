//
//  MovieTrailersNetworkConfiguration.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

enum MovieTrailersNetworkConfiguration {
    case getMovieTrailers(String)
}

extension MovieTrailersNetworkConfiguration: Configuration {
    var baseURL: String { return NetworkingConstant.baseUrl }
    
    var path: String {
        switch self {
        case .getMovieTrailers(let movieID):
            return "3/movie/\(movieID)/videos"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMovieTrailers(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMovieTrailers(_):
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
