//
//  Home+TableView.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.listOfSections.count 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.listOfSections[indexPath.section] {
        case .popularSection:
            let cell = tableView.dequeue(MovieSliderContainerTableViewCell.self, for: indexPath)
            cell.item = listOfPopularMovies
            cell.delegate = self
            return cell
        case .upcomingSection:
            let cell = tableView.dequeue(MovieContainerTableViewCell.self, for: indexPath)
            cell.item = listOfUpcomingMovies
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomSectionHeaderView.className) as? CustomSectionHeaderView {
            headerView.item = listOfSections[section].sectionTitle
            headerView.backgroundColor = .white
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
       return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        switch self.listOfSections[section] {
        case .popularSection:
            return 50.0
        case .upcomingSection:
            return 50.0
        }
    }
    
    func showRefresh(_ refresh: UIRefreshControl, selector: Selector) {
        refresh.addTarget(self, action: selector, for: .valueChanged)
        tableView.addSubview(refresh)
    }
    
    func createLoadingView(_ loadingView: UIView, indicator: UIActivityIndicatorView) {
        loadingView.layer.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50)
        indicator.color = UIColor.lightGray
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        loadingView.addSubview(indicator)
        centerIndicator(loadingView, indicator: indicator)
        tableView.tableFooterView = loadingView
    }
    
    func centerIndicator(_ loadingView: UIView, indicator: UIActivityIndicatorView) {
        let xCenterConstraint = NSLayoutConstraint(
            item: loadingView, attribute: .centerX, relatedBy: .equal,
            toItem: indicator, attribute: .centerX, multiplier: 1, constant: 0
        )
        
        loadingView.addConstraint(xCenterConstraint)
        let yCenterConstraint = NSLayoutConstraint(
            item: loadingView, attribute: .centerY, relatedBy: .equal,
            toItem: indicator, attribute: .centerY, multiplier: 1, constant: 0
        )
        
        loadingView.addConstraint(yCenterConstraint)
    }
}
