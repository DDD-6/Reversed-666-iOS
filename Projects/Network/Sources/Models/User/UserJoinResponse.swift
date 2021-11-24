//
//  UserJoinResponse.swift
//  Network
//
//  Created by devming on 2021/11/24.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct UserJoinResponse: Codable {
    var id: Int?
    var anonymousId: String?
    
    enum CodingKeys: String, CodingKey, Codable {
        case id
        case anonymousId = "anonymous_id"
    }
}
