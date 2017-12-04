//
//  BaseNavigationController.swift
//  swift_test
//
//  Created by apple on 2017/10/31.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let navBar =  UINavigationBar.appearance()
        navBar.barTintColor = UIColor.red  // 设置导航栏背景颜色  为红色
        
        var attrs = [String : AnyObject]()
        attrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 16)
        attrs[NSForegroundColorAttributeName] = UIColor.white
        navBar.titleTextAttributes = attrs  // 设置导航栏标题颜色 和 字体大小
        
        // 设置导航栏背景图片
        navBar.setBackgroundImage(UIImage(named: "tabbar_home"), for: .default)
        
        //navBar.setBackgroundImage(UIImage(named: "tabbar_discover"), forBarPosition: .Any, barMetrics: .Default)
        
        
        
        let navItem = UIBarButtonItem.appearance()  // 获取全局的BarButtonItem
        
        
        
        navBar.backItem?.leftBarButtonItem?.customView?.backgroundColor = UIColor.white
        
        
        
        navBar.tintColor = UIColor.white  // 全局设置 BarButtonItem 的颜色  为白色
        
        
        
        
        
        navItem.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for: .default)   // 通过设置把系统的自带的返回字切掉，保留返回的指示图标

        
    }

    
    
}

