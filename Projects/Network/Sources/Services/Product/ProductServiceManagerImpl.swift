//
//  ProductServiceManagerImpl.swift
//  Repository
//
//  Created by devming on 2021/09/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class ProductServiceManagerImpl: NSObject, ProductServiceComponent {
    
    public var provider: MoyaProvider<Service>
    
    required public override init() {
        provider = MoyaProvider<Service>()
        super.init()
    }
}

extension ProductServiceManagerImpl {
    /// Product 추가하는 API
    public func addLikeProudct(folderId: Int, siteUrl: String) -> AnyPublisher<StatusMessageResponse, MoyaError> {
        let likeParam = ProductLikeRequest(folderId: folderId, siteUrl: siteUrl)
        return request(type: StatusMessageResponse.self,
                       target: .addLikeProduct(request: likeParam))
    }
    
    /// Product list 가져오는 API
    public func fetchProduct(folderId: Int) -> AnyPublisher<[ProductListResponse], MoyaError> {
        return request(type: [ProductListResponse].self,
                       target: .fetchProduct(id: folderId))
    }
}
