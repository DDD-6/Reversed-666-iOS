//
//  Parser.swift
//  Repository
//
//  Created by devming on 2021/09/28.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, BringError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .jsonError(msg: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}

public protocol DomainModel {
    // Domain에 맞는 DTO타입을 정의
    associatedtype DTOType
    
    // DTO와 Domain Model을 맵핑
    static func from(dtoModel: DTOType) -> Self
}
