//
//  NetworkService.swift
//  swift_test
//
//  Created by apple on 2017/10/19.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//


import Foundation
import HandyJSON

public struct NetworkService {

    public static func networkPostrequest(parameters: [String : String], requestApi: String, modelClass :String, response: @escaping (_ responseObject : [String : AnyObject]) -> (), failture : @escaping (_ error : NSError)->())  {
        
            NetworkRequest.sharedInstance.NetworkPostRequest(URL: LoginUrlString, params:parameters as [String : AnyObject] , success: { (responseObject) in
                
                //转模
//                var Model = swiftClassFromString(className:modelClass)
                
//                var model = baseModel.init()
                
                
                if ((swiftClassFromString(className: modelClass) as? baseModel.Type )?.deserialize(from: responseObject)) != nil {

                    response(responseObject)

                }
                
            }) { (Error) in
                
                
                failture(Error)
    
                print(Error);
                
        }
    }
}

    // create a static method to get a swift class for a string name
     func swiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            // generate the full name of your class (take a look into your "YourProject-swift.h" file)
            let classStringName = appName + "." + className
            // return the class!b
            return NSClassFromString(classStringName)
        }
        return nil;
    }

