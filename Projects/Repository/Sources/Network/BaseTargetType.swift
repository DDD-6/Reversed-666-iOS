//
//  BaseTargetType.swift
//  Repository
//
//  Created by devming on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import CombineMoya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {
    public var baseURL: URL {
        guard let url = URL(string: "http://SERVER_URL/api/\(version)") else {
            fatalError("Wrong URL!!")
        }
        return url
    }
    
    public var task: Task {
        .requestPlain
    }
    
    var version: String {
        "v1"
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
