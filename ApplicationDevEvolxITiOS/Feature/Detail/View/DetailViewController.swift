//
//  DetailViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

class DetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var giveRatingButton: UIButton!
    
    var listOfSections: [DetailSections] = [
        .watchNowSection,
        .descriptionSection,
        .ratingSection
    ]
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        tableView.isPagingEnabled = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.registerForCells(
            WatchNowTableViewCell.className,
            DescriptionTableViewCell.className,
            RatingInfoTableViewCell.className
        )
    }
}
