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

public class ProductServiceManagerMock: NSObject, ProductServiceComponent {
    public var provider: MoyaProvider<Service>
    
    required public override init() {
        provider = MoyaProvider<Service>()
        super.init()
    }
}

extension ProductServiceManagerMock {
    /// Product 추가하는 API
    public func addLikeProudct(folderId: Int, siteUrl: String) -> AnyPublisher<StatusMessageResponse, MoyaError> {
        let likeParam = ProductLikeRequest(folderId: folderId, siteUrl: siteUrl)
        return requestMock(type: StatusMessageResponse.self,
                           target: .addLikeProduct(request: likeParam))
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    /// Product list 가져오는 API
    public func fetchProduct(folderId: Int) -> AnyPublisher<[ProductListResponse], MoyaError> {
        return requestMock(type: [ProductListResponse].self,
                           target: .fetchProduct(id: folderId))
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
}
