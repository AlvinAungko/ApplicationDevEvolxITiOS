//
//  BaseCollectionViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

class BaseCollectionViewCell<T>: UICollectionViewCell {
    
    var item: T? {
        didSet {
            if let item = item {
                bindData(item)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUIs()
        applyTheme()
        setupTest()
    }
    
    func setupUIs() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyTheme()
    }
 
    func applyTheme() {

    }
    
    func setupTest() {
        
    }
    
    func bindData(_ item: T) {
        
    }
}
