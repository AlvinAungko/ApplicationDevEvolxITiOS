//
//  DetailViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var interactor: DetailInteractorProtocol? { get set }
    func didGetMovieDetail(model: MovieDetail)
    func didGetErrorMessage(service: ServiceError)
}

protocol DetailViewDelegate: AnyObject {
    func didTapPlayTrailer(movieID: Int)
    func didTapSeasons(movieID: Int)
    func didTapWishList(movieID: Int, wishListStatus: WishListStatus)
}

class DetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var giveRatingButton: UIButton!
    var interactor: DetailInteractorProtocol?
    var detailModel: MovieDetail?
    var id: Int?
    var movieType: MovieType?
    var databaseUpdateService: DataUpdateService?
    
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
        self.showLoading()
        interactor?.getMovieDetail(movieID: self.id ?? 0)
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

extension DetailViewController: DetailViewProtocol {
    func didGetMovieDetail(model: MovieDetail) {
        self.detailModel = model
        self.hideLoading()
        self.tableView.reloadData()
    }
    
    func didGetErrorMessage(service: ServiceError) {
        let error = service.issueCode
        switch error {
        case .UNAUTHORIZED:
            debugPrint(error.message)
        case .SESSION_EXPIRE:
            debugPrint(error.message)
        case .SESSION_NOT_FOUND:
            debugPrint(error.message)
        case .TIME_OUT:
            debugPrint(error.message)
        case .CUSTOM_MES(let message):
           debugPrint(message)
        }
        self.showDialog(descriptionMessage: error.message)
        self.hideLoading()
    }
}
