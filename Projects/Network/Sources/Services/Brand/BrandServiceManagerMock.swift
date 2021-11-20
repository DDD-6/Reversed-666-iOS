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
    
    required public override init() {
        
        super.init()
    }
}

extension BrandServiceManagerMock {
    /// Brand 가져오는 API
    public func fetchBrand(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return requestMock(type: [BrandModelDTO].self,
                           target: .fetchBrands(name: name))
            .compactMap { $0.first }
            .eraseToAnyPublisher()
    }
    
    /// 모든 Brand 가져오는 API
    public func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return requestMock(type: [BrandModelDTO].self,
                           target: .fetchBrands(name: ""))
    }
}
