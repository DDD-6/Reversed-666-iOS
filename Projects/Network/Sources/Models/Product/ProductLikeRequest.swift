//
//  ProductLikeRequest.swift
//  Network
//
//  Created by devming on 2021/11/25.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct ProductLikeRequest: Encodable {
    var folderId: Int
    var siteUrl: String
    
    enum CodingKeys: String, CodingKey, Encodable {
        case folderId = "folder"
        case siteUrl = "site_url"
    }
}
