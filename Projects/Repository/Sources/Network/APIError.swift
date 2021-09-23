//
//  APIError.swift
//  Repository
//
//  Created by devming on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya

protocol ErrorType: Error {
    var code: Int { get }
}

// code 값은 임시 값입니다.
enum BringError: ErrorType {
    case jsonError
    case unauthorized
    case unconnected
    case unknown
    
    var code: Int {
        switch self {
            case .jsonError:
                return 4001
            case .unauthorized:
                return 4002
            case .unconnected:
                return 4003
            case .unknown:
                return 4000
        }
    }
}
