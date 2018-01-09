//
//  ViewController.swift
//  swift_test
//
//  Created by apple on 2017/8/3.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//



import UIKit

import Alamofire

import HandyJSON

class BasicTypes: HandyJSON {
    var int: Int = 2
    var doubleOptional: Double?
    var stringImplicitlyUnwrapped: String!
    
    required init() {}
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "swift"
       
//        var a1 : Bool? = nil
//        a1 = anyCommenElements(lsh: ["1"],rsh: ["123"])
//        print(a1?.description ?? "-----")
        
        
//        NetworkService.loginWithEmail(email: "", password: "") { (responseObject) in
//
//
//
//        }
        
        let para : Dictionary = [String: String]()
        

        //"versionNum" : "1.0.0",
        //"origin" : "002001"
    
        NetworkService.networkPostrequest(parameters: para, requestApi: "http://int.dpool.sina.com.cn/iplookup/iplookup.php", modelClass: "baseModel", response: { (response) in


        }) { (Error) in


        }
        
        
//        NetworkRequest.sharedInstance.NetworkGetRequest(URL: "http://int.dpool.sina.com.cn/iplookup/iplookup.php", params: para as [String : AnyObject], success: { (response) in
//
//
//        }) { (error) in
//
//
//        }
        
        
    }
    
//    NetworkService.networkPostrequest(parameters: para, requestApi: "http://172.168.1.234:1106/teacher/loginTeacherByMobile", modelClass: "baseModel", response: { (response) in
//
//
//
//    }, failture: { (error) in
//
//
//
//    })
    
    
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

