//
//  ViewController.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.global().async {
            UIApplication.shared.openURL(URL(string: "https://www.baidu.com")!)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func launch(_ sender: Any) {
        
        
    }
    
}

