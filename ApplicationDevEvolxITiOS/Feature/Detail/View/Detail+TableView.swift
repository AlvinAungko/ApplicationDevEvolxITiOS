//
//  Detail+TableView.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

extension DetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listOfSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch listOfSections[indexPath.section] {
        case .watchNowSection:
            let cell = tableView.dequeue(WatchNowTableViewCell.self, for: indexPath)
            return cell
        case .descriptionSection:
            let cell = tableView.dequeue(DescriptionTableViewCell.self, for: indexPath)
            return cell
        case .ratingSection:
            let cell = tableView.dequeue(RatingInfoTableViewCell.self, for: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
    }
}
