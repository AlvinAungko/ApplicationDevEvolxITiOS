//
//  VideoDisplayViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Alvin  on 26/07/2023.
//

import UIKit
import AVFoundation
import AVKit
import WebKit

class VideoDisplayViewController: BaseViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlValidationService: URLValidationService?
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        super.viewDidLoad()
        switch urlValidationService?.validateUrl(url: "http://thinkingform.com/video-sample-mp4/") {
        case .isValid:
            self.playYouTubeVideo(url: URL(string: "http://thinkingform.com/video-sample-mp4/")!)
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
        DispatchQueue.main.async {
            self.webView.load(URLRequest(url: url))
        }
    }
}

extension VideoDisplayViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.showLoading()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.hideLoading()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.showDialog(descriptionMessage: error.localizedDescription)
    }
}
