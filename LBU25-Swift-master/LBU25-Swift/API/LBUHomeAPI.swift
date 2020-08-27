//
//  LBUHomeAPI.swift
//  LBU25-Swift
//
//  Created by ios010 on 2020/8/26.
//  Copyright © 2020 刘博. All rights reserved.
//
import Moya
import HandyJSON
import MBProgressHUD
import UIKit

let HomeLoadingProvider = MoyaProvider<LBUHomeAPI>(requestClosure: timeoutClosure, plugins: [LoadingPlugin])

enum LBUHomeAPI {
     case bananerList(type: Int)
}

extension LBUHomeAPI: TargetType {
    var path: String {
        switch self {
        case .bananerList: return "v3/banner/list"
        }
    }
    
    var method: Moya.Method { return .post }
    
    var sampleData: Data { return "".data(using: String.Encoding.utf8)! }
    
    var task: Task {
        var parmeters: [String : Any] = [:]
         switch self {
           case .bananerList(let type):
               parmeters["type"] = type
            
            default: break
            
           }
         return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
       return nil
    }
    
    var baseURL: URL {
        return URL(string: "https://app.qijiebahao.com/")!
    }
    
    
    
}



