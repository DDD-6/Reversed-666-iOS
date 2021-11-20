//
//  Parser.swift
//  Repository
//
//  Created by devming on 2021/09/28.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Combine

public func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, MoyaError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error -> MoyaError in
            return MoyaError.encodableMapping(error)
//            let code = 499
//            let response = Response(statusCode: code,
//                                    data: data)
//            return MoyaError.jsonMapping(response)
        }
        .eraseToAnyPublisher()
}

public protocol DomainModel {
    // Domain에 맞는 DTO타입을 정의
    associatedtype DTOType
    
    // DTO와 Domain Model을 맵핑
    init(from dtoModel: DTOType)
}
