//
//  HomeViewController+DBDatasource.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

extension HomeViewController {
    func retrieveDataFromDB(movieType: MovieType) {
        switch movieType {
        case .upcoming:
            self.dataBaseDataRetrieveService?.retrieveData(dbResponseModel: UpcomingMovieModel.self, completion: { result in
                switch result {
                case .successful(let array):
                    self.listOfUpcomingMovies = array
                case .failure(let serviceError):
                    self.showDialog(descriptionMessage: serviceError.message)
                }
            })
        case .popular:
            self.dataBaseDataRetrieveService?.retrieveData(dbResponseModel: PopularMovieModel.self, completion: { result in
                switch result {
                case .successful(let array):
                    self.listOfPopularMovies = array
                case .failure(let serviceError):
                    self.showDialog(descriptionMessage: serviceError.message)
                }
            })
        }
    }
}
