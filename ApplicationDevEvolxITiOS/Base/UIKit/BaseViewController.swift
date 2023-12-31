//
//  BaseViewController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import UIKit
import Alamofire
import SVProgressHUD

protocol BaseViewControllerProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ error: ServiceError)
}

class BaseViewController: UIViewController {
    
    // MARK: - Private Variable
    @IBOutlet weak var backbutton: UIButton?
    var refresh = UIRefreshControl()
    private let networkReachability = NetworkReachabilityManager()!
    private var skip: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        applyLocalization()
        networkReachability.startListening { [weak self] status in
            guard let self = self else { return }
            if status == .notReachable || status == .unknown {
                self.connectionDisconnected()
                self.skip = 1
            } else {
                if self.skip != 0 {
                    self.connectionReconnected()
                }
            }
        }
    }
    
    func setupUI() {
        backbutton?.addTarget(self, action: #selector(self.handleBackAction), for: .touchUpInside)
    }
    
    @objc func handleBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Localized String in a View Controller
    func applyLocalization() {}
    
    func addObserverKeyBoard() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShowNotification),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHideNotification),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    func updateLayoutWhenKeyboardChanged(height: CGFloat) {}
    
    func connectionDisconnected() {
        print("[Reachibility]: Disconnected")
    }
    
    func connectionReconnected() {
        print("[Reachibility]: Reconnected")
    }
    
    func showDialog(descriptionMessage: String) {
        let dialog = BaseDialog()
        dialog.preferredDialogSizing = .init(horizontal: .large, vertical: .fit)
        dialog.descriptionMessage = descriptionMessage
        self.present(dialog, animated: true)
    }
}

// MARK: - BaseViewControllerProtocol

extension BaseViewController: BaseViewControllerProtocol {
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showError(_ error: ServiceError) {
        SVProgressHUD.showError(withStatus: error.message)
        SVProgressHUD.dismiss(withDelay: 1.5)
    }
}

// MARK: - Private

private extension BaseViewController {
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame: NSValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let heightSafeArea = UIApplication.shared.mainKeyWindow?.safeAreaInsets.bottom ?? 0.0
        
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        updateLayoutWhenKeyboardChanged(height: keyboardHeight - heightSafeArea + 5)
    }
    
    @objc func keyboardWillHideNotification(_ notification: Notification) {
        updateLayoutWhenKeyboardChanged(height: 0)
    }
}
