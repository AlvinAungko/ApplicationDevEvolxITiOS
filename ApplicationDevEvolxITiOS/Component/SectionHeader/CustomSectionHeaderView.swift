//
//  CustomSectionHeaderView.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

class CustomSectionHeaderView: UITableViewHeaderFooterView {
    
    var item: String? {
        didSet {
            if let item = item {
                self.bindData(item)
            }
        }
    }
    
    static let reuseIdentifier: String = CustomSectionHeaderView.className
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    @IBOutlet weak var mainTitle: UILabel!
    
    func bindData(_ item: String) {
        self.mainTitle.text = item
    }
}

