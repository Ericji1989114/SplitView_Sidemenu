//
//  DetailVC.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let detailLbl = UILabel()
        detailLbl.text = "detail"
        detailLbl.textColor = UIColor.black
        detailLbl.textAlignment = .center
        self.view.addSubview(detailLbl)
        detailLbl.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(self.test))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func test() {
        splitViewController?.toggleMasterView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Detail did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Detail will appear")
    }
}
