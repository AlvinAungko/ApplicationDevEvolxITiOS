//
//  DetailInteractor.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    var worker: DetailWorkerProtocol? { get set }
    func getMovieDetail(movieID: Int)
}

class DetailInteractor: DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol?
    var worker: DetailWorkerProtocol?
    
    func getMovieDetail(movieID: Int) {
        worker?.getMovieDetail(movieID: movieID, completion: { result in
            switch result {
            case .success(let success):
                self.presenter?.didGeMovieDetail(res: success)
            case .failure(let failure):
                self.presenter?.didGetErrorMessage(service: failure)
            }
        })
    }
}
