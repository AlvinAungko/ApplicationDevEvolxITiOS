//
//  HomeViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    func didGetUpComingMovies(movieModel: [UpcomingMovieModel])
    func didGetPopularMovies(movieModel: [PopularMovieModel])
    func didGetErrorMessage(error: ServiceError)
}

protocol HomeViewDelegate: AnyObject {
    func didUpdateMovieWishList(wishStatus: WishListStatus, movieType: MovieType, id: Int)
    func didTapMovie(movieID: Int, movieType: MovieType)
}

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listOfSections: [HomePageSections] = [.popularSection, .upcomingSection, .upcomingSection]
    var interactor: HomeInteractorProtocol?
    var listOfUpcomingMovies: [UpcomingMovieModel] = []
    var listOfPopularMovies: [PopularMovieModel] = []
    var dataUpdateService: DataUpdateService?
    var dataBaseDataRetrieveService: DatabaseDataRetrieveService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showRefresh(refresh, selector: #selector(self.refresh(_:)))
        self.retrieveDataFromDB(movieType: .upcoming)
        self.retrieveDataFromDB(movieType: .popular)
        self.tableView.reloadData()
        self.showLoading()
        interactor?.getUpcomingMovies()
        interactor?.getPopularMovies()
    }
    
    override func setupUI() {
        super.setupUI()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isPagingEnabled = true
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        tableView.isPagingEnabled = true
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.register(
            CustomSectionHeaderView.nib,
            forHeaderFooterViewReuseIdentifier: CustomSectionHeaderView.reuseIdentifier
        )
        
        tableView.registerForCells(
            MovieContainerTableViewCell.className,
            MovieSliderContainerTableViewCell.className
        )
    }
    
    @objc func refresh(_ sender: Any) {
        interactor?.getPopularMovies()
        interactor?.getUpcomingMovies()
    }

}

extension HomeViewController: HomeViewProtocol {
    
    func didGetUpComingMovies(movieModel: [UpcomingMovieModel]) {
        self.listOfUpcomingMovies = movieModel
        self.tableView.reloadData()
        self.hideLoading()
        refresh.endRefreshing()
    }
    
    func didGetPopularMovies(movieModel: [PopularMovieModel]) {
        self.listOfPopularMovies = movieModel
        self.tableView.reloadData()
        self.hideLoading()
        refresh.endRefreshing()
    }
    
    func didGetErrorMessage(error: ServiceError) {
        let error = error.issueCode
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
        refresh.endRefreshing()
    }
}

extension HomeViewController: HomeViewDelegate {
    func didUpdateMovieWishList(wishStatus: WishListStatus, movieType: MovieType, id: Int) {
        dataUpdateService?.updateMovie(movieStatus: wishStatus, movieID: id, movieType: movieType, completion: { updateStaus in
            switch updateStaus {
            case .failure:
                self.showDialog(descriptionMessage: updateStaus.statusMessage)
            case .success:
                self.showDialog(descriptionMessage: updateStaus.statusMessage)
            }
        })
        self.tableView.reloadData()
    }
    
    func didTapMovie(movieID: Int, movieType: MovieType) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
