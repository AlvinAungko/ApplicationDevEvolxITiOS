//
//  DatabaseManager.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import RealmSwift

class RealmManager {
    static var shared = RealmManager().realm()
    let configuration = Realm.Configuration(schemaVersion: 1)
    
    func realm() -> Realm {
        let realm = try! Realm(configuration: configuration)
        return realm
    }
}
