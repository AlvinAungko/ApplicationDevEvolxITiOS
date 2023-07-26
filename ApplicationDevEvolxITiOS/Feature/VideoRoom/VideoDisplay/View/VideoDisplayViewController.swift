//
//  VideoDisplayViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Alvin  on 26/07/2023.
//

import UIKit
import AVFoundation
import AVKit

class VideoDisplayViewController: BaseViewController {
    
    var urlValidationService: URLValidationService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch urlValidationService?.validateUrl(url: "https://thinkingform.com/video-sample-mp4/") {
        case .isValid:
            self.playYouTubeVideo(url: URL(string: "https://thinkingform.com/video-sample-mp4/")!)
        case .isNotValid:
            self.showDialog(descriptionMessage: "Invalid URL")
        default:
            break
        }
    }
    
    override func setupUI() {
        super.setupUI()
    }
    
    func playYouTubeVideo(url: URL) {
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1), queue: DispatchQueue.main) { time in
                if let error = player.error {
                    self.showDialog(descriptionMessage: error.localizedDescription)
                } else {
                    playerViewController.player?.play()
                }
            }
        }
    }
}
