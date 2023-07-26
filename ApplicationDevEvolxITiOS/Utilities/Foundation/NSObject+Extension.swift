//
//  NSObject+Extension.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation

enum YouTubeIDStatus {
    case isValid
    case isNotValid
}

extension NSObject: ClassNameProtocol {}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
    
    internal func generateVideoID(url: String, result: @escaping(YouTubeIDStatus, String) -> Void){
        do {
            let regex = try NSRegularExpression(pattern: "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)", options: .caseInsensitive)
            let match = regex.firstMatch(in: url, options: .reportProgress, range: NSMakeRange(0, url.lengthOfBytes(using: String.Encoding.utf8)))
            let range = match?.range(at: 0)
            if let range = range {
                let youTubeID = (url as NSString).substring(with: range)
                result(.isValid, youTubeID)
            } else {
                result(.isNotValid, "")
            }
            
        } catch {
            print(error)
        }
    }
}
