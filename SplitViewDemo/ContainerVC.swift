//
//  ContainerVC.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//


import UIKit

class ContainerVC: UIViewController {

    override func overrideTraitCollection(forChildViewController childViewController: UIViewController) -> UITraitCollection? {        
        return UITraitCollection(horizontalSizeClass: .regular)
    }

}
