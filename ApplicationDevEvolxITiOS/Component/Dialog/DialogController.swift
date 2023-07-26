//
//  DialogController.swift
//  ApplicationDevEvolxITiOS
//
//  Created by Aung Ko Ko on 26/07/2023.
//

import Foundation
import UIKit

class DialogController: UIViewController {

    struct PreferredDialogSizing {

        enum Horizontal: CGFloat {
            case fit = 0 // Fit, based on the view's constraints
            case small = 0.6
            case medium = 0.75
            case large = 0.9
            case fill = 10 // Some high number
        }

        enum Vertical: CGFloat {
            case fit = 0 // Fit, based on the view's constraints
            case matched = 0.8
            case fill = 10 // Some high number
        }

        let horizontal: Horizontal
        let vertical: Vertical
    }

    private lazy var dialogTransitioningDelegate = DialogTransitioningDelegate(
        preferredDialogEdgeInset: preferredDialogEdgeInset,
        preferredDialogCornerRadius: preferredDialogCornerRadius,
        preferredDialogSizingFactor: .init(
            multiplier: preferredDialogSizing.horizontal.rawValue,
            verticalAdjustmentMultiplier: preferredDialogSizing.vertical.rawValue
        ),
        preferredDialogBackdropColor: preferredDialogBackdropColor
    )

    override var additionalSafeAreaInsets: UIEdgeInsets {
        get {
            .init(
                top: super.additionalSafeAreaInsets.top + preferredDialogCornerRadius/2,
                left: super.additionalSafeAreaInsets.left + preferredDialogCornerRadius/2,
                bottom: super.additionalSafeAreaInsets.bottom + preferredDialogCornerRadius/2,
                right: super.additionalSafeAreaInsets.right + preferredDialogCornerRadius/2
            )
        }
        set {
            super.additionalSafeAreaInsets = newValue
        }
    }

    override var modalPresentationStyle: UIModalPresentationStyle {
        get {
            .custom
        }
        set { }
    }

    override var transitioningDelegate: UIViewControllerTransitioningDelegate? {
        get {
            dialogTransitioningDelegate
        }
        set { }
    }

    var preferredDialogEdgeInset: CGFloat = 15 {
        didSet {
            dialogTransitioningDelegate.preferredDialogEdgeInset = preferredDialogEdgeInset
        }
    }

    var preferredDialogCornerRadius: CGFloat = 15 {
        didSet {
            dialogTransitioningDelegate.preferredDialogCornerRadius = preferredDialogCornerRadius
        }
    }

    var preferredDialogSizing: PreferredDialogSizing = .init(horizontal: .medium, vertical: .matched) {
        didSet {
            dialogTransitioningDelegate.preferredDialogSizingFactor = .init(
                multiplier: preferredDialogSizing.horizontal.rawValue,
                verticalAdjustmentMultiplier: preferredDialogSizing.vertical.rawValue
            )
        }
    }

    var preferredDialogBackdropColor: UIColor = UIColor.black {
        didSet {
            dialogTransitioningDelegate.preferredDialogBackdropColor = preferredDialogBackdropColor
        }
    }

    var tapToDismissEnabled: Bool = true {
        didSet {
            dialogTransitioningDelegate.tapToDismissEnabled = tapToDismissEnabled
        }
    }
}
