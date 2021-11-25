//
//  BrandServiceComponent.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Combine
import CombineMoya

public protocol BrandServiceComponent {
    typealias Service = BrandService
    
    var provider: MoyaProvider<Service> { get }
    
    func fetchBrand(id: String) -> AnyPublisher<BrandModelDTO, MoyaError>
    func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError>
    func fetchLikeBrands() -> AnyPublisher<[BrandLikeListResponse], MoyaError>
    func fetchPopularBrands() -> AnyPublisher<[BrandModelDTO], MoyaError>
    func postBrand(id: Int) -> AnyPublisher<BrandLikeActionResponse, MoyaError>
}

extension BrandServiceComponent {
    
    func request<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return provider
            .requestPublisher(target)
            .map(type, atKeyPath: keyPath)
    }
    
    func requestMock<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return decode(target.sampleData)
    }
}
