//
//  Network.swift
//  swift_test
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 chenxianghong. All rights reserved.
//

import Foundation

import UIKit
import Alamofire



private let NetworkRequestShareInstance = NetworkRequest()

class NetworkRequest {
    class var sharedInstance : NetworkRequest {
        return NetworkRequestShareInstance
    }
}
extension NetworkRequest {
    
    
    /// POST请求封装
    func  NetworkPostRequest(URL:String ,params : [String : AnyObject], success : @escaping (_ responseObject : [String : AnyObject])->(), failture : @escaping (_ error : NSError)->()) {
        
        //添加 统一参数
        
        
        PostRequest(urlString: URL, params: params, success: { (responseObject) in
            
            success(responseObject)
        }) { (Error) in
            
            failture(Error as NSError)
            
            print(Error);
            //错误处理
            
        }
        
        
        
        
    }
    
        /// GET请求封装
        func NetworkGetRequest(URL:String, params : [String : AnyObject], success : @escaping (_ responseObject : [String : AnyObject])->(), failture : @escaping (_ error : NSError)->()) {
            
            //添加统一参数
            
            getRequest(urlString: URL, params: params, success: { (responseObject) in
                success(responseObject)
            }) { (error) in
                failture(error as NSError)
            }
        }
    
    }
    




    
    
    //MARK: - GET 请求
    //    let tools : NetworkRequest.shareInstance!
    
    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        //使用Alamofire进行网络请求时，调用该方法的参数都是通过getRequest(urlString， params, success :, failture :）传入的，而success传入的其实是一个接受           [String : AnyObject]类型 返回void类型的函数
        
        Alamofire.request(urlString, method: .get, parameters: params)
            .responseJSON { (response) in/*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //                    if let value = response.result.value as? [String: AnyObject] {
                    success(value as! [String : AnyObject])
                    //                    }
//                    let json = JSON(value)
//                    PrintLog(message: json)
                    
                case .failure(let error):
                    failture(error)
                    PrintLog(message: "error:\(error)")
                }
        }
        
        
    }
    //MARK: - POST 请求
    func PostRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        let headers: HTTPHeaders =  [    "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
                                         "Accept": "application/json"]
        
        
        Alamofire.request(urlString, method : HTTPMethod.post , parameters : params, encoding: JSONEncoding.default ,  headers: headers).responseJSON { response in

            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    //                    let json = JSON(value)
                    //                    PrintLog(message: json)
                }
            case .failure(let error):
                failture(error)
                PrintLog(message: "error:\(error)")
            }

        }
        
        
        
//        Alamofire.request(urlString, method : HTTPMethod.post , parameters : params, encoding: JSONEncoding.default ,  headers: headers).responseString { (response) in
//            
//            print(response)
//            
//            if let json = response.result.value {
//                print("JSON: \(json)")
//            }
//            
////            let dic = convertToDictionary(text: response.result);
//            
//
//            
//        }
        
        
//        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
//            switch response.result{
//            case .success:
//                if let value = response.result.value as? [String: AnyObject] {
//                    success(value)
////                    let json = JSON(value)
////                    PrintLog(message: json)
//                }
//            case .failure(let error):
//                failture(error)
//                PrintLog(message: "error:\(error)")
//            }

//        }
    }
    
    //MARK: - 照片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:
    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
//                            let json = JSON(value)
//                            PrintLog(message: json)
                        }
                    }
                case .failure(let encodingError):
                    PrintLog(message: encodingError)
                    failture(encodingError)
                }
        }
        )
    }





func convertToDictionary(text: String) -> [String: Any]? {
    if let data = text.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}


