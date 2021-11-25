//
//  ProductListResponse.swift
//  Repository
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct ProductListResponse: Codable {
    public var id: Int?
    public var brand: BrandListResponse?
    public var name: String?
    public var price: String?
    public var imageUrl: String?
    public var siteUrl: String?
    public var addedBrand: Int?
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case brand
        case name
        case price
        case imageUrl = "image_url"
        case siteUrl = "site_url"
        case addedBrand = "added_brand"
    }
}

