//
//  BrandServiceManager.swift
//  Repository
//
//  Created by devming on 2021/09/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class BrandServiceManager: NSObject {
    public typealias TargetAPI = BrandService
    
    public var provider: MoyaProvider<TargetAPI>
    public var isStub: Bool = false
    public var sampleStatusCode = 0
    public var customEndpointClosure: ((TargetAPI) -> Endpoint)? = nil
    
    required public init(isStub: Bool = false,
                         sampleStatusCode: Int = 0,
                         customEndpointClosure: ((TargetAPI) -> Endpoint)? = nil) {
        self.provider = MoyaProvider<TargetAPI>()
        self.isStub = isStub
        self.sampleStatusCode = sampleStatusCode
        
        self.provider = BrandServiceManager.makeProvider(isStub,
                                     sampleStatusCode,
                                     customEndpointClosure)
        
        super.init()
    }
}

/// Brand 가져오는 API
extension BrandServiceManager: ProviderProtocol {
    public func fetchBrand(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        if isStub {
            return mockBrandData(name: name)
        }
        return fetchBrandData(name: name)
    }
    
    private func fetchBrandData(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return request(type: BrandModelDTO.self,
                       target: .fetchBrands(name: name))
    }
    
    private func mockBrandData(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return requestMock(type: [BrandModelDTO].self,
                           target: .fetchBrands(name: name))
            .compactMap { $0.first }
            .eraseToAnyPublisher()
    }
}

/// 모든 Brand 가져오는 API
extension BrandServiceManager {
    public func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        if isStub {
            return mockBrandDatas()
        }
        return fetchBrandDatas()
    }
    
    private func fetchBrandDatas() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return request(type: [BrandModelDTO].self,
                       target: .fetchBrands(name: ""))
    }
    
    private func mockBrandDatas() -> AnyPublisher<[BrandModelDTO], MoyaError> {        
        return requestMock(type: [BrandModelDTO].self,
                            target: .fetchBrands(name: ""))
    }
}
