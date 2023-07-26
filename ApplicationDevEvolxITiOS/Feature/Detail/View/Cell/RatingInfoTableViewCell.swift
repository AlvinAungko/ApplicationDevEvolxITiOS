//
//  RatingInfoTableViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

class RatingInfoTableViewCell: BaseTableViewCell<MovieDetailRatingSection> {

    @IBOutlet weak var numberOfRatesLabel: UILabel!
    @IBOutlet weak var numberOfVotesLabel: UILabel!
    
    override func setupUIs() {
        super.setupUIs()
    }
    
    override func bindData(_ item: MovieDetailRatingSection) {
        super.bindData(item)
        numberOfRatesLabel.text = item.rating
        numberOfVotesLabel.text = item.voteCount
    }
    
}
