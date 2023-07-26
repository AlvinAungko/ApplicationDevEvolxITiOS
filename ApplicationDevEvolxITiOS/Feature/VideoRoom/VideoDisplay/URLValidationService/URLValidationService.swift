//
//  URLValidationService.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

enum URLStatus {
    case isValid
    case isNotValid
}

class URLValidationService {
    func validateUrl(url: String) -> URLStatus {
        return URL(string: url) != nil ? .isValid : .isNotValid
    }
}

