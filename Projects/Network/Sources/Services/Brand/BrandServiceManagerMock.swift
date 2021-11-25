//
//  BrandServiceManagerMock.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class BrandServiceManagerMock: NSObject, BrandServiceComponent {
    public var provider: MoyaProvider<Service>
    
    required public override init() {
        provider = MoyaProvider<Service>()
        super.init()
    }
}

extension BrandServiceManagerMock {
    /// Brand 가져오는 API
    public func fetchBrand(id: String) -> AnyPublisher<BrandModelDTO, MoyaError> {
        return requestMock(type: BrandModelDTO.self,
                           target: .fetchBrand(id: id))
    }
    
    /// 모든 Brand 가져오는 API
    public func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return requestMock(type: [BrandModelDTO].self,
                           target: .fetchBrandAll)
    }
    
    public func fetchLikeBrands() -> AnyPublisher<[BrandLikeListResponse], MoyaError> {
        return requestMock(type: [BrandLikeListResponse].self,
                           target: .fetchLikedBrands)
    }
    
    public func fetchPopularBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return requestMock(type: [BrandModelDTO].self,
                           target: .fetchPopularBrands)
    }
    
    public func postBrand(id: Int) -> AnyPublisher<BrandLikeActionResponse, MoyaError> {
        let requestParam = BrandLikeRequest(id: id)
        return requestMock(type: BrandLikeActionResponse.self,
                           target: .postBrandLike(id: requestParam))
    }
}
