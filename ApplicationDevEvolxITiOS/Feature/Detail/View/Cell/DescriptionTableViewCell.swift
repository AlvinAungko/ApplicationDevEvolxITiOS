//
//  DescriptionTableViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

class DescriptionTableViewCell: BaseTableViewCell<MovieDetailDescriptionSection> {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: MovieDetailDescriptionSection) {
        super.bindData(item)
        descriptionLabel.text = item.movieDescription
        releaseDateLabel.text = item.releaseDate
    }
    
}
