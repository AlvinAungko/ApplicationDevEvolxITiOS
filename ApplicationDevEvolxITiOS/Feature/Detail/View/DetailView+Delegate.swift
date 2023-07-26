//
//  DetailView+Delegate.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

extension DetailViewController {
    func didUpdateWishList(movieType: MovieType, movieWishListStatus: WishListStatus, movieID: Int) {
        self.detailModel?.wishListStatus = movieWishListStatus
        self.databaseUpdateService?.updateMovie(movieStatus: movieWishListStatus, movieID: movieID, movieType: movieType, completion: { result in
            self.showDialog(descriptionMessage: result.statusMessage)
        })
        self.tableView.reloadData()
    }
    
    func playMovieTrailer(movieID: Int) {
        let vc = VideoRoomRouter.createModule()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func playFullMovie(movieID: Int) {
        let vc = VideoRoomRouter.createModule()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
