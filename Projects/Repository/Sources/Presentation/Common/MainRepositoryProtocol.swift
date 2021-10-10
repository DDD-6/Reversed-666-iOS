//
//  MainRepositoryProtocol.swift
//  MainRepositoryProtocol
//
//  Created by devming on 2021/10/10.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Combine

@available(iOS 13.0, *)
public protocol MainRepositoryProtocol {
    func fetchBrand(name: String) -> AnyPublisher<BrandModelDTO, MoyaError>
    func fetchAllBrands() -> AnyPublisher<[BrandModelDTO], MoyaError>
}
