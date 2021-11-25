//
//  BrandLikeListResponse.swift
//  Network
//
//  Created by devming on 2021/11/25.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct BrandLikeListResponse: Codable {
    public var id: Int?
    public var isAdded: Bool?
    public var bringBasicBrand: BrandModelDTO?
//    public var userAddedBrand: BrandModelDTO?
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case isAdded = "Is_added"
        case bringBasicBrand = "brand"
//        case userAddedBrand = "added_brand"
    }
}
