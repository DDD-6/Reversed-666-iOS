//
//  UserService.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire
import Combine

public enum UserService {
    case getUserInfo(String)
    case joinUser
}

extension UserService: TargetType {
    public var path: String {
//        var base = baseURL.absoluteString
        switch self {
            case let .getUserInfo(anonymousId):
                return "/user/\(anonymousId)"
            case .joinUser:
                return "/user"
        }
    }
    
    public var method: Moya.Method {
        switch self {
            case .getUserInfo, .joinUser:
                return .get
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var task: Task {
        switch self {
            case .getUserInfo, .joinUser:
                return .requestPlain
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
            case .getUserInfo, .joinUser:
                return URLEncoding.default
        }
    }
    
    public var headers: [String: String]? {
        var headers = ["Content-Type": "application/json"]
        switch self {
            case .getUserInfo:
                if let anonymousId: String = BringUserDefaults.anonymousId.value() {
                    headers["Authorization"] = anonymousId
                }
            default:
                break
        }
        return headers
    }
    
    public func getSample<D: Decodable>() -> D? {
        switch self {
            case .getUserInfo:
                return try? JSONDecoder()
                    .decode(
                        UserInfoResponse.self,
                        from: sampleData
                    ) as? D
            case .joinUser:
                return try? JSONDecoder()
                    .decode(
                        UserJoinResponse.self,
                        from: sampleData
                    ) as? D
        }
    }
}

extension UserService {
    public var sampleData: Data {
        switch self {
            case .getUserInfo:
                return mockUserInfo
            case .joinUser:
                return mockJoin
        }
    }
    
    private var mockUserInfo: Data {
        let mockDatas =
            UserInfoResponse(
                id: 19,
                anonymousId: "098c1183-6265-43b5-93b4-fd1bc6a1fdc1",
                appleId: nil,
                kakaoId: nil,
                email: nil,
                nickname: nil,
                profileImage: nil,
                createdAt: "2021-11-24T11:50:43.572Z",
                updatedAt: "2021-11-24T11:50:43.572Z"
            )
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
    
    private var mockJoin: Data {
        let mockDatas = UserJoinResponse(
            id: 19,
            anonymousId: "098c1183-6265-43b5-93b4-fd1bc6a1fdc1"
        )
        guard let data = try? JSONEncoder().encode(mockDatas) else {
            return Data()
        }
        
        return data
    }
}
