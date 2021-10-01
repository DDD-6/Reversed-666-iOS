//
//  MainAPIProvider.swift
//  Repository
//
//  Created by devming on 2021/09/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

@available(iOS 13.0, *)
public class MainAPIProvider: NSObject {
    
    let provider: MoyaProvider<MainAPI>
    
    public override init() {
        provider = MoyaProvider<MainAPI>()
        
        super.init()
    }
}

/// Brand 가져오는 API
@available(iOS 13.0, *)
extension MainAPIProvider {
    public func fetchBrand(name: String = "", isMocked: Bool) -> AnyPublisher<BrandModelDTO, MoyaError> {
        if isMocked {
            return mockBrandData(name: name)
        }
        return fetchBrandData(name: name)
    }
    
    private func fetchBrandData(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return provider
            .requestPublisher(.fetchBrands(name: name))
            .map(BrandModelDTO.self)
    }
    
    private func mockBrandData(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        let data: BrandModelDTO? = MainAPI.fetchBrands(name: name).getSample()
        
        return Just(data)
            .compactMap { $0 }
            .tryMap { $0 }
            .mapError { error -> MoyaError in
                return MoyaError.encodableMapping(error)
            }
            .eraseToAnyPublisher()
    }
}

/// 모든 Brand 가져오는 API
@available(iOS 13.0, *)
extension MainAPIProvider {
    public func fetchBrands(isMocked: Bool) -> AnyPublisher<[BrandModelDTO], MoyaError> {
        if isMocked {
            return mockBrandDatas()
        }
        return fetchBrandDatas()
    }
    
    private func fetchBrandDatas() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        return provider
            .requestPublisher(.fetchBrands(name: ""))
            .map([BrandModelDTO].self)
    }
    
    private func mockBrandDatas() -> AnyPublisher<[BrandModelDTO], MoyaError> {
        let data: [BrandModelDTO]? = MainAPI.fetchBrands(name: "").getSamples()
        
        return Just(data!)
            .compactMap { $0 }
//            .publisher
            .tryMap { $0 }
            .mapError { error -> MoyaError in
                return MoyaError.encodableMapping(error)
            }
            .eraseToAnyPublisher()
    }
}
