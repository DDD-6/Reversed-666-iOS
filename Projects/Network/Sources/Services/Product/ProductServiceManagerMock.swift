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
    /// Brand 가져오는 API
    public func fetchProduct(name: String = "") -> AnyPublisher<ProductModelDTO, MoyaError> {
        return requestMock(type: ProductModelDTO.self,
                           target: .fetchProduct(name: name))
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
}
