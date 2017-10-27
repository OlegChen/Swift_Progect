//
//  MeVC.swift
//  swift_test
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

import UIKit

class MeVC: UITableViewController {
    
    
    @IBOutlet var tableview: UITableView!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    self.tableview.register(MeBaseCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        
        
        return cell!
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
    
    
    
}
