//
//  AddressAPI.swift
//  MoyaPlay
//
//  Created by Rentaro on 2020/03/22.
//  Copyright © 2020 Rentaro. All rights reserved.
//

import Moya

enum AddressApi {
    case search(request: Dictionary<String, Any>)
}

extension AddressApi: TargetType {
    //呼び出すAPIのURLを書く
    var baseURL: URL {
        return URL(string: "http://zipcloud.ibsnet.co.jp/api")!
    }
    
    //APIのpathを書く
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    //apiのメソッドを書く
    var method: Moya.Method {
        return .get
    }
    
    //ここはsampledateだからいじらなくてもよい
    var sampleData: Data {
        return Data()
    }
    
    //apiで何を送りたいのかを書く(ここではパラメータ)
    var task: Task {
        switch self {
        case .search(let request):
            return .requestParameters(parameters: request, encoding: URLEncoding.default)
        }
    }
    
    //リクエストヘッダの設定
    var headers: [String : String]? {
        return ["components-type": "application/json"]
    }
}
