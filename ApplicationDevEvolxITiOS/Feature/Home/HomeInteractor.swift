//
//  HomeInteractor.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

protocol HomeInteractorProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    var worker: HomeNetworkingWorkerProtocol? { get set }
    var databaseManager: Realm? { get set }
    func getUpcomingMovies()
    func getPopularMovies()
}

class HomeInteractor: HomeInteractorProtocol {
    var presenter: HomePresenterProtocol?
    var worker: HomeNetworkingWorkerProtocol?
    var databaseManager: Realm?
    
    func getUpcomingMovies() {
        worker?.getUpcomingMovies(completion: { result in
            switch result {
            case .success(let success):
                success.forEach { [weak self] upcomingMovie in
                    do {
                        try self?.databaseManager?.write({
                            self?.databaseManager?.add(upcomingMovie, update: .modified)
                        })
                    } catch {
                        self?.presenter?.didGetErrorMessage(error: ServiceError(issueCode: .CUSTOM_MES(message: "Database-Write Error")))
                    }
                }
                self.presenter?.didGetUpcomingMovies(model: success)
            case .failure(let failure):
                self.presenter?.didGetErrorMessage(error: failure)
            }
        })
    }
    
    func getPopularMovies() {
        worker?.getPopularMovies(completion: { result in
            switch result {
            case .success(let success):
                success.forEach { [weak self] popularMovie in
                    do {
                        try self?.databaseManager?.write({
                            self?.databaseManager?.add(popularMovie, update: .modified)
                        })
                    } catch {
                        self?.presenter?.didGetErrorMessage(error: ServiceError(issueCode: .CUSTOM_MES(message: "Database-Write Error")))
                    }
                }
                self.presenter?.didGetPopularMovies(model: success)
            case .failure(let failure):
                self.presenter?.didGetErrorMessage(error: failure)
            }
        })
    }
}
