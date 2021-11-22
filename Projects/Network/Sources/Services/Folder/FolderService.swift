//
//  FolderService.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Combine

public enum FolderService {
    case fetchFolders
    case fetchFolder(id: String)
    case createFolder(request: BookmarkFolderRequest)
}

extension FolderService: TargetType {
    public var path: String {
        var resultPath = baseURL.absoluteString
        switch self {
            case let .fetchFolder(folderId):
                resultPath += "/folder/\(folderId)"
            case .fetchFolders:
                resultPath += "/folder"
            case .createFolder:
                resultPath += "/folder"
        }
        return resultPath
    }
    
    public var method: Moya.Method {
        switch self {
            case .fetchFolder, .fetchFolders:
                return .get
            case .createFolder:
                return .post
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Task {
        switch self {
            case .fetchFolder, .fetchFolders:
                return .requestPlain
            case let .createFolder(request):
                return .requestJSONEncodable(request)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .fetchFolder, .fetchFolders:
                return URLEncoding.default
            case .createFolder:
                return JSONEncoding.default
        }
    }
    
    public func getSample<D: Decodable>() -> D? {
        switch self {
            case .fetchFolder:
                return try? JSONDecoder()
                    .decode(
                        BookmarkFolderResponse.self,
                        from: sampleData
                    ) as? D
            default:
                return nil
        }
    }
    
    public func getSamples<D: Decodable>() -> [D]? {
        switch self {
            case .fetchFolders:
                return try? JSONDecoder()
                    .decode(
                        [BookmarkFolderResponse].self,
                        from: sampleData
                    ) as? [D]
            default:
                return nil
        }
    }
}

extension FolderService {
    public var sampleData: Data {
        switch self {
            case .fetchFolders:
                return mockFolders
            case .fetchFolder:
                return mockFolder
            case .createFolder:
                return mockCreated
        }
    }
    
    private var mockFolders: Data {
        let mockDatas = [
            BookmarkFolderResponse(
                id: 1,
                name: "길동이 선물",
                thumbnailUrl: "https://devmjun.github.io/img/posts/Moya-Tutorial-12.jpg"
            ),
            BookmarkFolderResponse(
                id: 2,
                name: "길동이 선물1",
                thumbnailUrl: "https://devmjun.github.io/img/posts/Moya-Tutorial-12.jpg"
            ),
            BookmarkFolderResponse(
                id: 3,
                name: "길동이 선물2",
                thumbnailUrl: "https://devmjun.github.io/img/posts/Moya-Tutorial-12.jpg"
            ),
        ]
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var mockFolder: Data {
        let mockDatas = BookmarkFolderResponse(
            id: 1,
            name: "길동이 선물",
            thumbnailUrl: "https://devmjun.github.io/img/posts/Moya-Tutorial-12.jpg"
        )
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var mockCreated: Data {
        let mockDatas = BookmarkFolderResponse(
            id: 1,
            name: "기본 폴더",
            thumbnailUrl: ""
        )
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
}
