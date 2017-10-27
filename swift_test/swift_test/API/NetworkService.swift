//
//  NetworkService.swift
//  swift_test
//
//  Created by apple on 2017/10/19.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

public struct NetworkService {

    public static func loginWithEmail(email: String, password: String, response: @escaping (_ responseObject : [String : AnyObject]) -> ()) {
        
        let parameters = [
            "grant_type": "password",
            "username": email,
            "password": password,
        ]
        
            NetworkRequest.sharedInstance.NetworkPostRequest(URL: LoginUrlString, params:parameters as [String : AnyObject] , success: { (responseObject) in
                
                response(responseObject)
                
            }) { (NSError) in
                
        }
    }
}
