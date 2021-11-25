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
    case fetchBrand(id: String)
    case fetchBrandAll
    case fetchPopularBrands
    case fetchBookmarkBrands
}

extension BrandService: TargetType {
    public var path: String {
        switch self {
            case let .fetchBrand(id):
                return "/brand/\(id)"
            case .fetchBrandAll:
                return "/brands/main/"
            case .fetchPopularBrands:
                return "/brands/popular"
            case .fetchBookmarkBrands:
                return "/brands/liked"
        }
    }

    public var method: Moya.Method {
        switch self {
            case .fetchBrand, .fetchBrandAll, .fetchPopularBrands, .fetchBookmarkBrands:
                return .get
        }
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Task {
        switch self {
            default:
                return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
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
                return try? JSONDecoder().decode(BrandModelDTO.self, from: sampleData) as? D
            default:
                return nil
        }
    }
    
    public func getSamples<D: Decodable>() -> [D]? {
        switch self {
            case .fetchBrand:
                return try? JSONDecoder().decode([BrandModelDTO].self, from: sampleData) as? [D]
            default:
                return nil
        }
    }
}

extension BrandService {
    public var sampleData: Data {
        switch self {
            case .fetchBrand:
                return mockBrand
            case .fetchBrandAll:
                return mainAllBrands
            case .fetchBookmarkBrands:
                return bookmarkBrands
            case .fetchPopularBrands:
                return popularBrands
        }
    }
    
    private var mockBrand: Data {
        let mockDatas = BrandModelDTO(
                id: 1,
                title: "의류",
                subTitle: "NAAAAike",
                brandLink: "https://www.nike.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .shoes
            )
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var mainAllBrands: Data {
        let mockDatas = [
            BrandModelDTO(
                id: 1,
                title: "의류",
                subTitle: "Nike",
                brandLink: "https://www.nike.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .shoes
            ),
            BrandModelDTO(
                id: 2,
                title: "전자기기",
                subTitle: "Apple",
                brandLink: "https://www.apple.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .accesary
            ),
            BrandModelDTO(
                id: 3,
                title: "가구",
                subTitle: "이케아",
                brandLink: "https://www.ikea.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .clothes
            ),
            BrandModelDTO(
                id: 3,
                title: "슬리퍼",
                subTitle: "아디다스",
                brandLink: "https://www.adidas.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .clothes
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var bookmarkBrands: Data {
        let mockDatas = [
            BrandModelDTO(
                id: 1,
                title: "의류임",
                subTitle: "나이끼",
                brandLink: "https://www.nike.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .shoes
            ),
            BrandModelDTO(
                id: 2,
                title: "애플애플",
                subTitle: "Apple",
                brandLink: "https://www.apple.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .accesary
            ),
            BrandModelDTO(
                id: 3,
                title: "스웨덴",
                subTitle: "이끼아",
                brandLink: "https://www.ikea.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .clothes
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var popularBrands: Data {
        let mockDatas = [
            BrandModelDTO(
                id: 1,
                title: "의류",
                subTitle: "Nike",
                brandLink: "https://www.nike.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .shoes
            ),
            BrandModelDTO(
                id: 2,
                title: "전자기기",
                subTitle: "Apple",
                brandLink: "https://www.apple.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .accesary
            ),
            BrandModelDTO(
                id: 3,
                title: "가구",
                subTitle: "이케아",
                brandLink: "https://www.ikea.com",
                imageName: "cityGuide",
                logoImage: "toronto",
                category: .clothes
            )
        ]
        
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }

}
