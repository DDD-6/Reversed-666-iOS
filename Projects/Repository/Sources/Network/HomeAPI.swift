//
//  HomeAPI.swift
//  Bring
//
//  Created by devming on 2021/09/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire

extension TargetType {
    public var baseURL: URL {
        return URL(string: "#")!
    }
}

public enum HomeAPI {
    case searchUser(query: String)
}

extension HomeAPI: TargetType {
    public var path: String {
        var resultPath = "/api/\(version)/"
        switch self {
            case .searchUser:
                resultPath += "searchUser"
        }
        return resultPath
    }
    
    public var method: Moya.Method {
        switch self {
            case .searchUser:
                return .get
        }
    }
    
    public var task: Task {
        .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    var version: String {
        "v1"
    }
}
