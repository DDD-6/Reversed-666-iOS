//
//  FolderServiceManagerImpl.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class FolderServiceManagerImpl: NSObject, FolderServiceComponent {
    
    required public override init() {
        super.init()
    }
}

extension FolderServiceManagerImpl {
    
    // 특정 folder id 조회
    public func fetchFolder(id: String) -> AnyPublisher<BookmarkFolderResponse, MoyaError> {
        return request(type: BookmarkFolderResponse.self,
                       target: .fetchFolder(id: id))

    }
    
    // 전체 폴더 리스트 조회
    public func fetchFoldersAll() -> AnyPublisher<[BookmarkFolderResponse], MoyaError> {
        return request(type: [BookmarkFolderResponse].self,
                       target: .fetchFolders)
    }
    
    // 폴더 생성 API
    public func createFolder(name: String, description: String) -> AnyPublisher<BookmarkFolderResponse, MoyaError> {
        let body = BookmarkFolderRequest(
            name: name,
            description: description
        )
        return request(type: BookmarkFolderResponse.self,
                       target: .createFolder(request: body))
    }
}
