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

    required public override init() {
        super.init()
    }
}

extension ProductServiceManagerImpl {
    /// Product 가져오는 API
    public func fetchProduct(name: String = "") -> AnyPublisher<ProductModelDTO, MoyaError> {
        return request(type: ProductModelDTO.self,
                       target: .fetchProduct(name: name))
    }
}
