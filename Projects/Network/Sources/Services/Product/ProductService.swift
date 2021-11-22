//
//  ProductService.swift
//  Bring
//
//  Created by devming on 2021/09/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Combine

public enum ProductService {
    case fetchProduct(name: String)
}

extension ProductService: TargetType {
    public var path: String {
        var resultPath = baseURL.absoluteString
        switch self {
            case .fetchProduct:
                resultPath += ""
        }
        return resultPath
    }

    public var method: Moya.Method {
        switch self {
            case .fetchProduct:
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
            default:
                return nil
        }
    }
    
    public var task: Task {
//        guard let parameters = parameters else {
//            return .requestPlain
//        }
//        var body: [String: Any] = [:]
        
        switch self {
            default:
                return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .fetchProduct:
                return JSONEncoding.default
            default:
                return URLEncoding.queryString
        }
    }
    
    public func getSample<D: Decodable>() -> D? {
        switch self {
            case .fetchProduct:
                return try? JSONDecoder().decode(BrandModelDTO.self, from: sampleData) as? D
            default:
                return nil
        }
    }
    
    public func getSamples<D: Decodable>() -> [D]? {
        switch self {
            case .fetchProduct:
                return try? JSONDecoder().decode([BrandModelDTO].self, from: sampleData) as? [D]
            default:
                return nil
        }
    }
    

}
