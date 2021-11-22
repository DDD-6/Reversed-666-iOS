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
    
    required public override init() {
        super.init()
    }
}

extension BrandServiceManagerImpl {
    /// Brand 가져오는 API
    public func fetchBrand(id: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return request(type: BrandModelDTO.self,
                       target: .fetchBrand(id: id))
    }
    
    /// 모든 Brand 가져오는 API
    public func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return request(type: [BrandModelDTO].self,
                       target: .fetchBrand(id: ""))
    }
    
    public func fetchBookmarkBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return request(type: [BrandModelDTO].self,
                       target: .fetchBookmarkBrands)
    }
    
    public func fetchPopularBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return request(type: [BrandModelDTO].self,
                       target: .fetchPopularBrands)
    }
}
