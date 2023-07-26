//
//  DatabaseDataRetrieveService.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

enum DBRetrieveResult<T: Object> {
    case successful([T])
    case failure(ServiceError)
}

class DatabaseDataRetrieveService {
    
    var realm: Realm
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func retrieveData<T: Object>(dbResponseModel: T.Type, completion: @escaping(DBRetrieveResult<T>) -> Void) {
        let movieList = Array(realm.objects(dbResponseModel.self))
        movieList.isEmpty ? completion(.failure(ServiceError(issueCode: .CUSTOM_MES(message: "No Data")))) : completion(.successful(movieList))
    }
}
