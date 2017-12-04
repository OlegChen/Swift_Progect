//
//  MeVC.swift
//  swift_test
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

import UIKit

class MeVC: UIViewController,UITableViewDelegate,UITableViewDataSource,BasePullTableViewDelegate {
    
    
    
    var tableview: BasePullTableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//        let view1 = UIView.init()
//        self.view.addSubview(view1)
//        view1.backgroundColor = UIColor.blue
//        view1.frame = CGRect.init(origin: .init(x: 0, y: 0), size: .init(width: 100, height: 100))
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.green
        
        self.view.backgroundColor = UIColor.white
        
        self.edgesForExtendedLayout = .bottom
        
        self.tableview = BasePullTableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.pullDelegate = self
        self.view.addSubview(self.tableview)
        self.tableview.es.removeRefreshFooter()
        
        self.tableview.register(MeBaseCell.self, forCellReuseIdentifier: "cell")
        
        
        
    }
    
    //MARK: refresh
    func PullToRefresh() {
        
        print(" ** 刷新 ** ")
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let cell = tableview.dequeueReusableCell(withIdentifier: "cell")
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    
    
    
    
}
