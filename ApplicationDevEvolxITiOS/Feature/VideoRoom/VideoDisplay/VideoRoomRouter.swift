//
//  VideoRoomRouter.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

class VideoRoomRouter {
    static func createModule() -> VideoDisplayViewController {
        let vc = VideoDisplayViewController()
        vc.urlValidationService = .init()
        return vc
    }
}
