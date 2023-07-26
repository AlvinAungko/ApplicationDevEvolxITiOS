//
//  MovieSliderContainerTableViewCell.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

class MovieSliderContainerTableViewCell: BaseTableViewCell<[PopularMovieModel]> {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var delegate: HomeViewDelegate?
    
    override func setupUIs() {
        super.setupUIs()
        setUpCollectionView()
        pageControl.tintColor = .placeholderText
        pageControl.currentPageIndicatorTintColor = .purple
    }
    
    override func bindData(_ item: [PopularMovieModel]) {
        super.bindData(item)
        pageControl.numberOfPages = item.count
        collectionView.reloadData()
    }
    
    func setUpCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.registerForCells(MovieSliderCollectionViewCell.className)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 0
        }
    }
    
}

extension MovieSliderContainerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSliderCollectionViewCell.className, for: indexPath) as? MovieSliderCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.item = self.item?[indexPath.row]
        cell.handleOnTapWishList { self.delegate?.didUpdateMovieWishList(wishStatus: $2, movieType: $0, id: $1) }
        cell.handleDidTapTrailer { self.delegate?.didTapWtachTrailer(movieType: $0, id: $1) }
        cell.handleDidTapWatchNow { self.delegate?.didTapWatchNow(movieType: $0, id: $1) }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didTapMovie(movieID: self.item?[indexPath.item].id ?? 0, movieType: .popular)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 12
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}
