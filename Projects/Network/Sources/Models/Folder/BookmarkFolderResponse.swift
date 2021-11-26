//
//  BookmarkFolderResponse.swift
//  Repository
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct BookmarkFolderResponse: Codable {
    public var id: Int?
    public var name: String?
    public var thumbnailUrl: [String]?
    public var numberOfProductCount: Int?
    public var description: String?
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case name
        case thumbnailUrl = "thumbnailurls"
        case numberOfProductCount = "products_num"
        case description
    }
}
