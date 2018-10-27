//
//  ContainerVC.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(oldValue)
            updateActiveViewController()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load CalculatorVC as the intial screen
        if let contentVC = splitViewController?.viewControllers[1] as? ContentVC {
            contentVC.activeViewController = UINavigationController(rootViewController: DetailVC())
        }
    }
    
}

extension ContentVC {
    fileprivate func removeInactiveViewController(_ inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            inActiveVC.willMove(toParentViewController: nil)
            inActiveVC.view.removeFromSuperview()
            inActiveVC.removeFromParentViewController()
        }
    }
    
    fileprivate func updateActiveViewController() {
        if let activeVC = activeViewController {
            addChildViewController(activeVC)
            activeVC.view.frame = containerView.bounds
            containerView.addSubview(activeVC.view)
            activeVC.didMove(toParentViewController: self)
        }
    }
}
