//
//  BasePullTableView.swift
//  swift_test
//
//  Created by apple on 2017/10/30.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

import ESPullToRefresh

import UIKit


@objc protocol BasePullTableViewDelegate: NSObjectProtocol {
    
    //设置协议方法
    @objc optional func PullToRefresh()
    @objc optional func PullToLoadMore()
    
}

class BasePullTableView: UITableView {
    
    //Delegate
    weak var pullDelegate: BasePullTableViewDelegate?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        //下拉
        self.es.addPullToRefresh {
            [unowned self] in
            /// Do anything you want...
            
            self.pullDelegate?.PullToRefresh!()
            
            /// Stop refresh when your job finished, it will reset refresh footer if completion is true
            self.es.stopPullToRefresh(ignoreDate: true)
            /// Set ignore footer or not
            self.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }
        
        
        //上拉刷新
        
        self.es.addInfiniteScrolling {
            [unowned self] in
            /// Do anything you want...

            self.pullDelegate?.PullToLoadMore!()
            
            /// If common end
            self.es.stopLoadingMore()
            /// If no more data
            self.es.noticeNoMoreData()
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

