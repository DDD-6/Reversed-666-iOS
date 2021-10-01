//
//  MainAPI.swift
//  Bring
//
//  Created by devming on 2021/09/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Combine

/// 샘플 코드 입니다.

public enum MainAPI {
    case searchUser(query: String)
    case fetchBrands(name: String)
}

extension MainAPI: BaseTargetType {
    public var path: String {
        var resultPath = baseURL.absoluteString
        switch self {
            case .searchUser:
                resultPath += "/searchUser"
            case let .fetchBrands(name):
                resultPath += "/brands/\(name)"
        }
        return resultPath
    }

    public var method: Moya.Method {
        switch self {
            case .searchUser:
                return .get
            case .fetchBrands:
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
            default:
                return nil
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
            default:
                return .requestPlain
//                return .requestCompositeParameters(bodyParameters: body,
//                                                   bodyEncoding: parameterEncoding,
//                                                   urlParameters: parameters)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .searchUser:
                return JSONEncoding.default
            default:
                return URLEncoding.queryString
        }
    }
    
    public func getSample<D: Decodable>() -> D? {
        switch self {
            case .searchUser:
                return try? JSONDecoder().decode(BrandModelDTO.self, from: sampleData) as? D
            case .fetchBrands:
                return try? JSONDecoder().decode(BrandModelDTO.self, from: sampleData) as? D
//                return try? JSONDecoder().decode(BrandModelDTO.self, from: sampleData)
        }
    }
    
    public var sampleData: Data {
        
        let mockDatas = [
            BrandModelDTO(
                id: 1,
                title: "Title1",
                subTitle: "Subtitle1",
                brandLink: "www.naver.com",
                imageName: "cityGuide",
                category: .shoes
            ),
            BrandModelDTO(
                id: 2,
                title: "Title2",
                subTitle: "Subtitle2",
                brandLink: "www.google.com",
                imageName: "montreal",
                category: .accesary
            ),
            BrandModelDTO(
                id: 3,
                title: "Title3",
                subTitle: "Subtitle3",
                brandLink: "www.yahoo.com",
                imageName: "toronto",
                category: .clothes
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }

}
