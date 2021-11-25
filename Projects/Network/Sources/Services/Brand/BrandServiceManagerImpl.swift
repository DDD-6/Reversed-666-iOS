//
//  BrandServiceManagerImpl.swift
//  Repository
//
//  Created by devming on 2021/09/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class BrandServiceManagerImpl: NSObject, BrandServiceComponent {
    public var provider: MoyaProvider<Service>
    
    required public override init() {
        provider = MoyaProvider<Service>()
        super.init()
    }
}

extension BrandServiceManagerImpl {
    /// 내 브랜드 추가 API
    public func addMyBrand(engName: String, korName: String, siteUrl: String) -> AnyPublisher<StatusMessageResponse, MoyaError> {
        let param = MyBrandRequest(engName: engName, korName: korName, siteUrl: siteUrl)
        return request(type: StatusMessageResponse.self,
                       target: .addMyBrand(request: param))
    }
    
    /// Brand 가져오는 API
    public func fetchBrand(id: String = "") -> AnyPublisher<BrandListResponse, MoyaError> {
        return request(type: BrandListResponse.self,
                       target: .fetchBrand(id: id))
    }
    
    /// 모든 Brand 가져오는 API
    public func fetchAllBrands() -> AnyPublisher<[BrandListResponse], MoyaError> {
        return request(type: [BrandListResponse].self,
                       target: .fetchBrandAll)
    }
    
    public func fetchLikeBrands() -> AnyPublisher<[BrandLikeListResponse], MoyaError> {
        return request(type: [BrandLikeListResponse].self,
                       target: .fetchLikedBrands)
    }
    
    public func fetchPopularBrands() -> AnyPublisher<[BrandListResponse], MoyaError> {
        return request(type: [BrandListResponse].self,
                       target: .fetchPopularBrands)
    }
    
    public func fetchSearchedBrands(keyword: String) -> AnyPublisher<[BrandListResponse], MoyaError> {
        
        return request(type: [BrandListResponse].self,
                       target: .fetchSearchedBrands(keyword: keyword))
            .debounce(for: 0.5, scheduler: RunLoop.current)
            .eraseToAnyPublisher()
    }
    
    public func postBrand(id: Int) -> AnyPublisher<StatusMessageResponse, MoyaError> {
        let requestParam = BrandLikeRequest(id: id)
        return request(type: StatusMessageResponse.self,
                       target: .postBrandLike(id: requestParam))
    }
}
