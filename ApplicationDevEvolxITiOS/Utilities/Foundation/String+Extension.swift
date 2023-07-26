//
//  String+Extension.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

extension String {
    var asTrimmed: String {
        trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func escape() -> String {
        let allowedCharacters = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        return allowedCharacters
    }
}
