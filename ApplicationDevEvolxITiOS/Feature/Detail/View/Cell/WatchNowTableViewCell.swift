//
//  WatchNowTableViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit
import SDWebImage

class WatchNowTableViewCell: BaseTableViewCell<MovieDetailWatchNowSection> {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var playTrailerButton: UIButton!
    @IBOutlet weak var playWatchNowButton: UIButton!
    @IBOutlet weak var wishListButton: UIButton!
    
    var onTapTrailer: ((Int) -> Void)?
    var onTapWatchNow: ((Int) -> Void)?
    var onTapWishList: ((MovieType,WishListStatus, Int) -> Void)?
    var movieType: MovieType?
    
    override func setupUIs() {
        super.setupUIs()
        playTrailerButton.addTarget(self, action: #selector(self.didTapTrailer), for: .touchUpInside)
        playWatchNowButton.addTarget(self, action: #selector(self.didTapPlayNow), for: .touchUpInside)
        wishListButton.addTarget(self, action: #selector(self.didTapWishList), for: .touchUpInside)
    }
    
    @objc func didTapTrailer() {
        self.onTapTrailer?(item?.movieID ?? 0)
    }
    
    @objc func didTapPlayNow() {
        self.onTapWatchNow?(item?.movieID ?? 0)
    }
    
    @objc func didTapWishList() {
        switch item?.wishListStatus {
        case .isWishListOn: onTapWishList?(
            self.movieType ?? .popular,
            .isWishListOff, item?.movieID ?? 0)
        default:
            onTapWishList?(
                self.movieType ?? .popular,
                .isWishListOn, item?.movieID ?? 0
            )
        }
    }
    
    override func bindData(_ item: MovieDetailWatchNowSection) {
        super.bindData(item)
        movieImage.sd_setImage(with: URL(string: item.movieImage))
        movieTitle.text = item.movieTitle
        switch item.wishListStatus {
        case .isWishListOn: wishListButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        default: wishListButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
    func handleTapTrailer(completion: @escaping(Int) -> Void) {
        self.onTapTrailer = completion
    }
    
    func handleTapWatchNow(completion: @escaping(Int) -> Void) {
        self.onTapWatchNow = completion
    }
    
    func handleTapWishList(completion: @escaping(MovieType,WishListStatus,Int) -> Void) {
        self.onTapWishList = completion
    }
    
}
