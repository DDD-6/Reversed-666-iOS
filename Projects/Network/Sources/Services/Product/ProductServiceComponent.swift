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

public protocol ProductServiceComponent {
    typealias Service = ProductService
    
    var provider: MoyaProvider<Service> { get }

    func addLikeProudct(folderId: Int, siteUrl: String) -> AnyPublisher<StatusMessageResponse, MoyaError>
    func fetchProduct(folderId: Int) -> AnyPublisher<[ProductListResponse], MoyaError>
}

extension ProductServiceComponent {
    
    func request<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return provider
            .requestPublisher(target)
            .map(type, atKeyPath: keyPath)
    }
    
    func requestMock<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return decode(target.sampleData)
    }
}
