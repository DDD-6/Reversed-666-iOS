//
//  FolderServiceComponent.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Combine
import CombineMoya

public protocol FolderServiceComponent {
    typealias Service = FolderService
    
    func fetchFolder(id: String) -> AnyPublisher<BookmarkFolderResponse, MoyaError>
    func fetchFoldersAll() -> AnyPublisher<[BookmarkFolderResponse], MoyaError>
    func createFolder(name: String, description: String) -> AnyPublisher<BookmarkFolderResponse, MoyaError>
}

extension FolderServiceComponent {
    
    var provider: MoyaProvider<Service> {
        return MoyaProvider<Service>()
    }
    
    func request<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return provider
            .requestPublisher(target)
            .map(type, atKeyPath: keyPath)
    }
    
    func requestMock<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: Service) -> AnyPublisher<D, MoyaError> {
        return decode(target.sampleData)
    }
}
