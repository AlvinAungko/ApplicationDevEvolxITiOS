//
//  BaseDialog.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

import UIKit

final class BaseDialog: DialogController {
    
    let doneButton = UIButton()
    var descriptionMessage: String?
    
    override func loadView() {
        view = UIView()
        
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.text = descriptionMessage
        
        doneButton.setTitle("Try Again", for: .normal)
        doneButton.layer.cornerRadius = 14
        doneButton.backgroundColor = .blue
        doneButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        doneButton.addTarget(self, action: #selector(handleDoneAction), for: .touchUpInside)
        
        let horizontalStackView = UIStackView(arrangedSubviews: [
           doneButton
        ])
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.alignment = .fill
        horizontalStackView.spacing = 16

        view.addSubview(titleLabel)
        view.addSubview(horizontalStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            horizontalStackView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 16),
            horizontalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            horizontalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        if #available(iOS 13.0, *) {
            view?.backgroundColor = .systemBackground
        } else {
            // Fallback on earlier versions
        }
    }
    
    @objc func handleDoneAction() {
        self.dismiss(animated: true)
    }
}
