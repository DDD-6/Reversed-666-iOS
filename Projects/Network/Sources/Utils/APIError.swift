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
    var errorMsg: String { get }
}

// code 값은 임시 값입니다.
public enum BringError: ErrorType {
    case sampleDataError
    case expiredToken
    case unconnected
    case unknown

    var code: Int {
        switch self {
            case .sampleDataError:
                return 4001
            case .expiredToken:
                return 4002
            case .unconnected:
                return 4003
            case .unknown:
                return 4000
        }
    }
    
    var errorMsg: String {
        switch self {
            case .sampleDataError:
                return "샘플 데이터에 에러가 있습니다."
            case .expiredToken:
                return "AcccessToken이 만료되었습니다."
            case .unconnected:
                return "네트워크 연결이 끊어졌습니다."
            case .unknown:
                return "알 수 없는 에러가 발생하였습니다."
        }
    }
}
