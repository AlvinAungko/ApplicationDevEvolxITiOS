//
//  MovieCollectionViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: BaseCollectionViewCell<UpcomingMovieModel> {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var movieTitle: UILabel!
    
    var onTapWishList: ((MovieType, Int, WishListStatus) -> Void)?
    
    override func setupUIs() {
        super.setupUIs()
        wishListButton.addTarget(self, action: #selector(self.handleWishList), for: .touchUpInside)
    }
    
    override func bindData(_ item: UpcomingMovieModel) {
        super.bindData(item)
        moviePoster.sd_setImage(with: URL(string: "\(item.imageUrl)\(item.posterPath.orEmpty)"))
        movieTitle.text = item.title
        switch item.movieStatus {
        case .isWishListOff: wishListButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        case .isWishListOn: wishListButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        default: wishListButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }

    @objc func handleWishList() {
        switch item?.movieStatus {
        case .isWishListOff: self.onTapWishList?(.upcoming, item?.id ?? 0, .isWishListOn)
        case .isWishListOn: self.onTapWishList?(.upcoming, item?.id ?? 0, .isWishListOff)
        default: self.onTapWishList?(.upcoming, item?.id ?? 0, .isWishListOn)
        }
    }
    
    func handleOnTapWishList(completion: @escaping(MovieType, Int, WishListStatus) -> Void) {
        self.onTapWishList = completion
    }
}
