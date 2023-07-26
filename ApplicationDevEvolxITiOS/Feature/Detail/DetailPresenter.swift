//
//  DetailPresenter.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    func didGeMovieDetail(res: MovieDetail)
    func didGetErrorMessage(service: ServiceError)
}


class DetailPresenter: DetailPresenterProtocol {
   var view: DetailViewProtocol?
    func didGeMovieDetail(res: MovieDetail) {
        view?.didGetMovieDetail(model: res)
    }
    
    func didGetErrorMessage(service: ServiceError) {
        view?.didGetErrorMessage(service: service)
    }
}
