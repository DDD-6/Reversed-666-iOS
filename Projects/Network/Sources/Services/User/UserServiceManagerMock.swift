//
//  UserServiceManagerMock.swift
//  Network
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Moya
import CombineMoya

public class UserServiceManagerMock: NSObject, UserServiceComponent {
    public var provider: MoyaProvider<Service>
    
    required public override init() {
        provider = MoyaProvider<Service>()
        
        super.init()
    }
}

extension UserServiceManagerMock {
    
    // user 정보 조회
    public func getUserInfo(id: String) -> AnyPublisher<UserInfoResponse, MoyaError> {
        return requestMock(type: UserInfoResponse.self,
                           target: .getUserInfo(id))
            .compactMap { $0 }
            .eraseToAnyPublisher()
    }
    
    // 로컬에 user 가입 데이터 없을 때 가입
    public func joinUser() -> AnyPublisher<String?, MoyaError> {
        return requestMock(type: UserJoinResponse.self,
                           target: .joinUser)
            .compactMap { $0.anonymousId }
            .eraseToAnyPublisher()
    }
}

