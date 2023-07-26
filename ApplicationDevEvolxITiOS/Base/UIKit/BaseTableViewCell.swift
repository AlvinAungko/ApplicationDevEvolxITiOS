//
//  BaseTableViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseTableViewCell<T>: UITableViewCell {
    let activityIndicatorView = NVActivityIndicatorView(
                                    frame: CGRect(x: 0, y: 0, width: 30, height: 30),
                                    type: .lineSpinFadeLoader, color: .blue
                                )
    
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
        self.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        applyTheme()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
 
    func applyTheme() {
        selectionStyle = .none
    }
    
    func setupTest() {
        
    }
    
    func bindData(_ item: T) {
        
    }
    
    func setUpFontAndTextColor(label: UILabel, font: UIFont, color: UIColor) {
        label.font = font
        label.textColor = color
    }
}
// Note: this is for Loading View
extension BaseTableViewCell {
    func showLoading(message: String = "") {
        activityIndicatorView.startAnimating()
    }
    
    func hideLoading() {
        activityIndicatorView.stopAnimating()
    }
}
