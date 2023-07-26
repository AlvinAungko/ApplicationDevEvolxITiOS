//
//  VideoDisplayViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Alvin  on 26/07/2023.
//

import UIKit
import AVFoundation
import AVKit
import YouTubePlayer

class VideoDisplayViewController: BaseViewController {
    
    @IBOutlet weak var playerView: YouTubePlayerView!
    var completion: ((Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       debugPrint("Testing Git.")
    }
    
    override func setupUI() {
        super.setupUI()
    }
    
    func playVideo(videoID: String) {
        
        let group = DispatchGroup()
        let queue = DispatchQueue.main
        
        self.showLoading()
        group.enter()
        queue.async(group: group) { [weak self] in
            guard let youtubeURL = URL(string: "https://www.youtube.com/watch?v=wVDEuVefTvA") else {
                self?.showDialog(descriptionMessage: "Wrong URL")
                return
            }
            
            self?.playerView.loadVideoURL(youtubeURL)
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.completion?(true)
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.completion = { isUrlLoaded in
                if isUrlLoaded {
                    self?.playerView.play()
                    self?.hideLoading()
                }
            }
        }
    }
    
    func generateVideoID() {
        let url = "https://www.youtube.com/watch?v=xwwAVRyNmgQ"
        
        //Get video ID
        do {
            let regex = try NSRegularExpression(pattern: "(?<=v(=|/))([-a-zA-Z0-9_]+)|(?<=youtu.be/)([-a-zA-Z0-9_]+)", options: .caseInsensitive)
            let match = regex.firstMatch(in: url, options: .reportProgress, range: NSMakeRange(0, url.lengthOfBytes(using: String.Encoding.utf8)))
            let range = match?.range(at: 0)
            if let range = range {
                let youTubeID = (url as NSString).substring(with: range)
                playVideo(videoID: youTubeID)
            } else {
                self.showDialog(descriptionMessage: "NO Range")
            }
            
        } catch {
            print(error)
        }
        
    }
}
