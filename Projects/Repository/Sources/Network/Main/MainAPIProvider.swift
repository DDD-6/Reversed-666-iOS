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
    
    public func fetchBrandDatas(name: String = "") -> AnyPublisher<BrandModelDTO, MoyaError> {
        return provider
            .requestPublisher(.fetchBrands(name: name))
            .map(BrandModelDTO.self)
//        return provider
//            .requestPublisher(.fetchBrands(name: ""))
//            .tryMap { response -> AnyPublisher<BrandModelDTO, BringError> in
//                return decode(response.data)
//            }
//            .eraseToAnyPublisher()
    }
    
    public func mockBrandDatas(name: String = "") -> BrandModelDTO? {
        return MainAPI.fetchBrands(name: name).getSample()
    }
}
