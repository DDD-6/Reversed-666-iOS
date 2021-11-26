//
//  UserInfoResponse.swift
//  Network
//
//  Created by devming on 2021/11/24.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct UserInfoResponse: Codable {
    var id: Int?
    var anonymousId: String?
    var appleId: String?
    var kakaoId: String?
    var email: String?
    var nickname: String?
    var profileImage: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey, Codable {
        case id
        case anonymousId = "anonymous_id"
        case appleId = "apple_id"
        case kakaoId = "kakao_id"
        case email
        case nickname
        case profileImage = "profile_image"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
