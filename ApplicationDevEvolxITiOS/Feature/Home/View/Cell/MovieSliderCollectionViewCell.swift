//
//  MovieSliderCollectionViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit
import SDWebImage

class MovieSliderCollectionViewCell: BaseCollectionViewCell<PopularMovieModel> {

    @IBOutlet weak var wishListButton: UIButton!
    @IBOutlet weak var watchNowButton: UIButton!
    @IBOutlet weak var playTrailerButton: UIButton!
    @IBOutlet weak var movieImage: UIImageView!
    
    var onTapWishList: ((MovieType, Int, WishListStatus) -> Void)?
    var onTapWatchTrailer: ((MovieType, Int) -> Void)?
    var onTapWatchNow: ((MovieType, Int) -> Void)?
    
    override func setupUIs() {
        super.setupUIs()
        wishListButton.addTarget(self, action: #selector(self.handleWishList), for: .touchUpInside)
    }
    
    override func bindData(_ item: PopularMovieModel) {
        super.bindData(item)
        movieImage.sd_setImage(with: URL(string: "\(item.imageUrl)\(item.posterPath.orEmpty)"))
        switch item.movieStatus {
        case .isWishListOn: wishListButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        default:wishListButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
    @objc func handlePlayTrailer() {
        self.onTapWatchTrailer?(.popular, item?.id ?? 0)
    }
    
    @objc func handleWatchNow() {
        self.onTapWatchNow?(.popular, item?.id ?? 0)
    }
    
    @objc func handleWishList() {
        switch item?.movieStatus {
        case .isWishListOn: self.onTapWishList?(.popular, item?.id ?? 0, .isWishListOff)
        default:self.onTapWishList?(.popular, item?.id ?? 0, .isWishListOn)
        }
    }
    
    func handleOnTapWishList(completion: @escaping(MovieType, Int, WishListStatus) -> Void) {
        self.onTapWishList = completion
    }
    
    func handleDidTapTrailer(completion: @escaping(MovieType, Int) -> Void) {
        self.onTapWatchTrailer = completion
    }
    
    func handleDidTapWatchNow(completion: @escaping(MovieType, Int) -> Void) {
        self.onTapWatchNow = completion
    }

}
