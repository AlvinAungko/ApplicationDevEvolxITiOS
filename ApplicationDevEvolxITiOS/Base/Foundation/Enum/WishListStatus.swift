//
//  WishListStatus.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

enum WishListStatus: Int, PersistableEnum {
    case isWishListOn = 0
    case isWishListOff = 1
}
