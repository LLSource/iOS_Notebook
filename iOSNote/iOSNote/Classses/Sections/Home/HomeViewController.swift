//
//  HomeViewController.swift
//  iOSNote
//
//  Created by li’s Air on 2018/7/7.
//  Copyright © 2018年 li’s Air. All rights reserved.
//

import UIKit

let homeCellID = "HomeViewController.cell"

class HomeViewController: BBSTableViewController {

    let arrClass = ["a", "b"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = NSStringFromClass(self.classForCoder)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: homeCellID)
    }

    
    

}

extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrClass.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: homeCellID)
        cell?.textLabel?.textColor = UIColor.black
        cell?.textLabel?.text = arrClass[indexPath.row]
        
        return cell!
    }
}



















