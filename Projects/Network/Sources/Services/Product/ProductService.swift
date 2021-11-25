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
    case fetchProduct(id: Int)
    case addLikeProduct(request: ProductLikeRequest)
}

extension ProductService: TargetType {
    public var path: String {
        switch self {
            case .fetchProduct(let id):
                return "/product/\(id)"
            case .addLikeProduct:
                return "/product"
        }
    }

    public var method: Moya.Method {
        switch self {
            case .fetchProduct:
                return .get
            case .addLikeProduct:
                return .post
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Task {
        switch self {
            case .fetchProduct:
                return .requestPlain
            case .addLikeProduct(let request):
                return .requestJSONEncodable(request)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .fetchProduct:
                return URLEncoding.default
            case .addLikeProduct:
                return JSONEncoding.default
        }
    }
    
    public var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        if let anonymousId: String = BringUserDefaults.anonymousId.value() {
            headers["Authorization"] = anonymousId
        }
        return headers
    }
    
    public func getSample<D: Decodable>() -> D? {
        switch self {
            case .fetchProduct:
                return try? JSONDecoder().decode(BrandListResponse.self, from: sampleData) as? D
            default:
                return nil
        }
    }
    
    public func getSamples<D: Decodable>() -> [D]? {
        switch self {
            case .fetchProduct:
                return try? JSONDecoder().decode([BrandListResponse].self, from: sampleData) as? [D]
            default:
                return nil
        }
    }
    

}

extension ProductService {
    public var sampleData: Data {
        switch self {
            case .fetchProduct:
                return mockProducts
            case .addLikeProduct:
                return postLike
        }
    }
    
    private var mockProducts: Data {
        
        let mockDatas = [
            ProductListResponse(
                id: 0,
                brand: BrandListResponse(
                    logoImageUrl: "http://d359ir5q8zekrf.cloudfront.net/logos/adidas_logo.jpg"
                ),
                name: "이큅먼트 10",
                price: "76300",
                imageUrl: "http://d359ir5q8zekrf.cloudfront.net/product/GX8529-01-01_720X720.jpeg",
                siteUrl: "https://shop.adidas.co.kr/PF020401.action?PROD_CD=GX8529",
                addedBrand: nil
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var postLike: Data {
        let mock = StatusMessageResponse(status: "Success")
        
        guard let data = try? JSONEncoder().encode(mock) else {
            return Data()
        }
        
        return data
    }
}
