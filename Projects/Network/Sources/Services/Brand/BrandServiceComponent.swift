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
    
    func addMyBrand(engName: String, korName: String, siteUrl: String) -> AnyPublisher<StatusMessageResponse, MoyaError>
    func fetchBrand(id: String) -> AnyPublisher<BrandListResponse, MoyaError>
    func fetchAllBrands() -> AnyPublisher<[BrandListResponse], MoyaError>
    func fetchLikeBrands() -> AnyPublisher<[BrandLikeListResponse], MoyaError>
    func fetchPopularBrands() -> AnyPublisher<[BrandListResponse], MoyaError>
    func fetchSearchedBrands(keyword: String) -> AnyPublisher<[BrandListResponse], MoyaError>
    func postBrand(id: Int) -> AnyPublisher<StatusMessageResponse, MoyaError>
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
