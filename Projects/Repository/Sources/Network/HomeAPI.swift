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

/// 샘플 코드 입니다.  
public enum HomeAPI {
    case searchUser(query: String)
}

extension HomeAPI: BaseTargetType {
    public var path: String {
        var resultPath = baseURL.absoluteString
        switch self {
            case .searchUser:
                resultPath += "/searchUser"
        }
        return resultPath
    }

    public var method: Moya.Method {
        switch self {
            case .searchUser:
                return .get
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
    var parameters: [String: Any]? {
        let defaultParameters: [String: Any] = [:]
        var parameters: [String: Any] = defaultParameters
        
        switch self {
            case .searchUser(let user):
                parameters["sampleParamName"] = user
                return parameters
        }
    }
    
    public var task: Task {
        guard let parameters = parameters else {
            return .requestPlain
        }
        var body: [String: Any] = [:]
        
        switch self {
            case .searchUser(let param):
                body["sampleBodyParamName"] = param
                return .requestParameters(parameters: parameters,
                                          encoding: parameterEncoding)
//                return .requestCompositeParameters(bodyParameters: body,
//                                                   bodyEncoding: parameterEncoding,
//                                                   urlParameters: parameters)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .searchUser:
                return JSONEncoding.default
//            case .queryStringAPI:
//                return URLEncoding.queryString
        }
    }
}
