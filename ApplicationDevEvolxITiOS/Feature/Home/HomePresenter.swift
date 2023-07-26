//
//  HomePresenter.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    func didGetUpcomingMovies(model: [UpcomingMovieModel])
    func didGetPopularMovies(model: [PopularMovieModel])
    func didGetErrorMessage(error: ServiceError)
}

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewProtocol?
    func didGetPopularMovies(model: [PopularMovieModel]) {
        view?.didGetPopularMovies(movieModel: model)
    }
    
    func didGetUpcomingMovies(model: [UpcomingMovieModel]) {
        view?.didGetUpComingMovies(movieModel: model)
    }
    
    func didGetErrorMessage(error: ServiceError) {
        view?.didGetErrorMessage(error: error)
    }
}
