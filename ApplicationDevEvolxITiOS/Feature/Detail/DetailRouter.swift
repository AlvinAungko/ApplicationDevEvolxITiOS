//
//  DetailRouter.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

class DetailRouter {
    static func createModule(id: Int? = nil, movieType: MovieType? = .none) -> DetailViewController {
        let vc = DetailViewController()
        vc.id = id
        vc.movieType = movieType
        let interactor = DetailInteractor()
        let worker = DetailWorker()
        let presenter = DetailPresenter()
        let dataBasemanager = RealmManager.shared
        vc.databaseUpdateService = .init(realmManager: dataBasemanager)
        vc.interactor = interactor
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = vc
        return vc
    }
}
