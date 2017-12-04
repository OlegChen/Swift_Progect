//
//  MeBaseCell.swift
//  swift_test
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

import UIKit
import SnapKit


class MeBaseCell: UITableViewCell {
    
    var tipView : UIView!
    var tipLabel : UILabel!
    var titleLabel : UILabel!

    
    var tipNum : Int = 0 {
    
        // 设置前调用
        willSet {
            print("willSet \(tipNum) newValue: \(newValue)")
            
            if tipNum > 0 {
                
                self.tipLabel.text = "\(tipNum)"
                self.tipView.isHidden = false
                
            }else{
                
                self.tipView.isHidden = true

            }
        }
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super .init(style: UITableViewCellStyle.default, reuseIdentifier: reuseIdentifier)
        
        //tip 
        tipView = UIView()
        self.contentView.addSubview(tipView)
        tipView.clipsToBounds = true
        tipView.layer.cornerRadius = 7.5
        tipView.backgroundColor = UIColor.red
        tipView.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(15);
            make.centerY.equalTo(self.contentView)
            make.right.equalTo(self.contentView).offset(-10)
        }
        
        
        tipLabel = UILabel()
        tipLabel.textAlignment = .center
        tipLabel.font = UIFont.systemFont(ofSize: 10)
        tipLabel.textColor = UIColor.white
        tipView.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            
            make.left.right.top.bottom.equalTo(tipView);
        }
        
        
        titleLabel = UILabel()
        titleLabel.text = "标题"
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.black
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(self.contentView).offset(15);
            make.centerY.equalTo(self.contentView)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
