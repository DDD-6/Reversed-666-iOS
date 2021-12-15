//
//  MainInteractor.swift
//  Domain
//
//  Created by devming on 2021/12/04.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Network
import Moya
import Combine
import CombineMoya

public class MainInteractor {
    
    private let serviceManager: BrandServiceComponent
    
    public init(serviceManager: BrandServiceComponent) {
        self.serviceManager = BrandServiceManagerImpl()
    }
    
    public func addMyBrand(engName: String, korName: String, siteUrl: String) -> AnyPublisher<Void, MoyaError> {
        serviceManager
            .addMyBrand(engName: engName,
                        korName: korName,
                        siteUrl: siteUrl)
            .map { _ in () }
            .eraseToAnyPublisher()
    }
    
    public func fetchBrand(id: String) -> AnyPublisher<BrandListResponse, MoyaError> {
        serviceManager
            .fetchBrand(id: id)
            .eraseToAnyPublisher()
    }
    
    public func fetchAllBrands() -> AnyPublisher<[BrandListResponse], MoyaError> {
        serviceManager
            .fetchAllBrands()
            .eraseToAnyPublisher()
    }
    
    public func fetchLikeBrands() -> AnyPublisher<[BrandLikeListResponse], MoyaError> {
        serviceManager
            .fetchLikeBrands()
            .eraseToAnyPublisher()
    }
    
    public func fetchPopularBrands() -> AnyPublisher<[BrandListResponse], MoyaError> {
        serviceManager
            .fetchPopularBrands()
            .eraseToAnyPublisher()
    }
    
    public func fetchSearchedBrands(keyword: String) -> AnyPublisher<[BrandListResponse], MoyaError> {
        serviceManager
            .fetchSearchedBrands(keyword: keyword)
            .eraseToAnyPublisher()
    }
    
    public func postBrand(id: Int) -> AnyPublisher<Bool, MoyaError> {
        serviceManager
            .postBrand(id: id)
            .map { _ in true }
            .eraseToAnyPublisher()
    }
}
