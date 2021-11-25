//
//  BrandService.swift
//  Bring
//
//  Created by devming on 2021/09/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Combine

public enum BrandService {
    // 브랜드 API
    case addMyBrand(request: MyBrandRequest)
    case fetchBrand(id: String)
    case fetchBrandAll
    case fetchPopularBrands
    case fetchSearchedBrands(keyword: String)
    
    // 좋아요한 브랜드 API
    case fetchLikedBrands
    case postBrandLike(id: BrandLikeRequest)
}

extension BrandService: TargetType {
    public var path: String {
        switch self {
            case .addMyBrand:
                return "/brand"
            case let .fetchBrand(id):
                return "/brand/\(id)"
            case .fetchBrandAll:
                return "/brands/main/"
            case .fetchPopularBrands:
                return "/brands/popular"
            case .fetchSearchedBrands:
                return "/brands/search"
            case .fetchLikedBrands:
                return "/brands/liked"
            case .postBrandLike:
                return "/brand/like"
        }
    }

    public var method: Moya.Method {
        switch self {
            case .fetchBrand,
                    .fetchBrandAll,
                    .fetchPopularBrands,
                    .fetchSearchedBrands,
                    .fetchLikedBrands:
                return .get
            case .addMyBrand,
                    .postBrandLike:
                return .post
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Task {
        switch self {
            case .postBrandLike(let id):
                return .requestJSONEncodable(id)
            case .addMyBrand(let request):
                return .requestJSONEncodable(request)
            default:
                return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .addMyBrand, .postBrandLike:
                return JSONEncoding.default
            default:
                return URLEncoding.default
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
            case .fetchBrand:
                return try? JSONDecoder().decode(BrandListResponse.self, from: sampleData) as? D
            default:
                return nil
        }
    }
    
    public func getSamples<D: Decodable>() -> [D]? {
        switch self {
            case .fetchBrandAll, .fetchPopularBrands, .fetchSearchedBrands:
                return try? JSONDecoder().decode([BrandListResponse].self, from: sampleData) as? [D]
            case .fetchLikedBrands:
                return try? JSONDecoder().decode([BrandLikeListResponse].self, from: sampleData) as? [D]
            default:
                return nil
        }
    }
}

extension BrandService {
    public var sampleData: Data {
        switch self {
            case .addMyBrand:
                return Data()
            case .fetchBrand:
                return mockBrand
            case .fetchBrandAll:
                return mainAllBrands
            case .fetchPopularBrands:
                return popularBrands
            case .fetchSearchedBrands:
                return mainAllBrands
            case .fetchLikedBrands:
                return bookmarkBrands
            case .postBrandLike:
                return Data()
        }
    }
    
    private var mockBrand: Data {
        let mockDatas = BrandListResponse(
                id: 1,
                engName: "의류",
                korName: "NAAAAike",
                brandLink: "https://www.nike.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .shoes
            )
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var mainAllBrands: Data {
        let mockDatas = [
            BrandListResponse(
                id: 1,
                engName: "의류",
                korName: "Nike",
                brandLink: "https://www.nike.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .shoes
            ),
            BrandListResponse(
                id: 2,
                engName: "전자기기",
                korName: "Apple",
                brandLink: "https://www.apple.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .accesary
            ),
            BrandListResponse(
                id: 3,
                engName: "가구",
                korName: "이케아",
                brandLink: "https://www.ikea.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .clothes
            ),
            BrandListResponse(
                id: 3,
                engName: "슬리퍼",
                korName: "아디다스",
                brandLink: "https://www.adidas.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .clothes
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var bookmarkBrands: Data {
        let basicBrand = BrandListResponse(
            id: 3,
            engName: "스웨덴",
            korName: "이끼아",
            brandLink: "https://www.ikea.com",
            thumbnailUrl: "cityGuide",
            logoImageUrl: "toronto",
            category: .clothes
        )
        let mock = [BrandLikeListResponse(id: 0,
                              isAdded: true,
                              bringBasicBrand: basicBrand)]
        
        guard let data = try? JSONEncoder().encode(mock) else {
            return Data()
        }
        
        return data
    }
    
    private var popularBrands: Data {
        let mockDatas = [
            BrandListResponse(
                id: 1,
                engName: "의류",
                korName: "Nike",
                brandLink: "https://www.nike.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .shoes
            ),
            BrandListResponse(
                id: 2,
                engName: "전자기기",
                korName: "Apple",
                brandLink: "https://www.apple.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .accesary
            ),
            BrandListResponse(
                id: 3,
                engName: "가구",
                korName: "이케아",
                brandLink: "https://www.ikea.com",
                thumbnailUrl: "cityGuide",
                logoImageUrl: "toronto",
                category: .clothes
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
