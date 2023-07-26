//
//  HomeRouter.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

class HomeRouter {
    static func createModule() -> HomeViewController {
        let vc = HomeViewController()
        
        let interactor = HomeInteractor()
        let worker = HomeNetworkingWorker()
        let presenter = HomePresenter()
        let databaseManager = RealmManager.shared
        
        vc.interactor = interactor
        vc.dataUpdateService = .init(realmManager: databaseManager)
        vc.dataBaseDataRetrieveService = .init(realm: databaseManager)
        
        interactor.databaseManager = databaseManager
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = vc
        
        return vc
    }
}
