//
//  BaseSectionModel.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol DetailSectionItem {
    func to<T: DetailSectionItem>(_ type: T.Type) -> T?
}

extension DetailSectionItem {
    func to<T: DetailSectionItem>(_ type: T.Type) -> T? {
        self as? T
    }
}
