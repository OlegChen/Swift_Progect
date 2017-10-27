//
//  ViewController.swift
//  swift_test
//
//  Created by apple on 2017/8/3.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "swift"
       
//        var a1 : Bool? = nil
//        a1 = anyCommenElements(lsh: ["1"],rsh: ["123"])
//        print(a1?.description ?? "-----")
        
        
        NetworkService.loginWithEmail(email: "", password: "") { (responseObject) in
            
            
            
        }
        
        
    }
    
//    
//    
//    func anyCommenElements<T:Sequence , U : Sequence> (lsh : T, rsh: U) -> Bool where T.Iterator.Element: Equatable , T.Iterator.Element == U.Iterator.Element  {
//        
//        for lhsItem in lsh {
//            
//            for rhsItem in rsh {
//                
//                if lhsItem == rhsItem {
//                    
//                    return true
//                }
//            }
//        }
//        return false
//        
//    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

