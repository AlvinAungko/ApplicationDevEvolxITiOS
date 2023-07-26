//
//  UICollectionView+Extension.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerForCells(_ strIDs: String...) {
        strIDs.forEach { (strID) in
            register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID)
        }
    }
    
    func registerForCells(_ strIDs: [String]) {
        strIDs.forEach { (strID) in
            register(UINib(nibName: strID, bundle: nil), forCellWithReuseIdentifier: strID)
        }
    }
}
