//
//  SplitVC.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//

import UIKit

class SplitVC: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        if UI_USER_INTERFACE_IDIOM() == .pad {
//            self.preferredDisplayMode = .allVisible
//        } else {
            self.preferredDisplayMode = .primaryOverlay
            self.preferredPrimaryColumnWidthFraction = 0.8
//        }
        self.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UISplitViewController {
    func toggleMasterView() {
        DispatchQueue.main.async {
            _ = self.displayModeButtonItem.target?.perform(self.displayModeButtonItem.action)
        }
    }
}

extension SplitVC: UISplitViewControllerDelegate {
    func splitViewController(_ svc: UISplitViewController, willChangeTo displayMode: UISplitViewControllerDisplayMode) {
//        for view in (svc.presentationController?.presentedView?.mostSuperView().subviews[1].subviews[0].subviews)! {
//            if view is UIPopoverBackgroundView {
//                view.isHidden = true
//                break
//            }
//        }
    
        svc.presentationController?.presentedView?.mostSuperView().hidePopoverBackgroundView()
//        print(1111)
    }
}

extension UIView {
    func mostSuperView() -> UIView {
        guard let superView = self.superview else {return self}
        return superView.mostSuperView()
    }
    
    func hidePopoverBackgroundView() {
        guard self.subviews.count != 0 else {return}
        let resultArray = self.subviews.filter{$0 is UIPopoverBackgroundView}
        if resultArray.count != 0 {
            for view in resultArray {
                view.isHidden = true
                return
            }
        } else {
            // go to next layer subview to go on searching
            for view in self.subviews {
                view.hidePopoverBackgroundView()
            }
        }
    }
}
