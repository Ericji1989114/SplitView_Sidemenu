//
//  MasterVC.swift
//  SplitViewDemo
//
//  Created by Ki, Un on 2018/04/07.
//  Copyright © 2018 Ki, Un. All rights reserved.
//

import UIKit

class MasterVC: UITableViewController {

    fileprivate var contentVC: ContentVC?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contentVC = splitViewController?.viewControllers[1] as? ContentVC {
            self.contentVC = contentVC
        }
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "reuseIdentifier")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Menu did appear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Menu will appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        if indexPath.row == 1 {
            cell.textLabel?.text = "Push Detail VC"
        }
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Switch on/off"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let nvc = UINavigationController(rootViewController: DetailVC())
            updateContentViewController(nvc)
            splitViewController?.toggleMasterView()
        }
    
        if indexPath.row == 0 {
            splitViewController?.toggleMasterView()
        }
    }
    
    func updateContentViewController(_ viewController: UIViewController) {
        guard let contentViewController = contentVC else { return }
        contentViewController.activeViewController = viewController
    }

}
