//
//  BaseSectionModel.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol SectionItem {
    func to<T: SectionItem>(_ type: T.Type) -> T?
}

extension SectionItem {
    func to<T: SectionItem>(_ type: T.Type) -> T? {
        self as? T
    }
}
