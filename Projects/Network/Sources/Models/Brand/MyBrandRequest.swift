//
//  MyBrandRequest.swift
//  Network
//
//  Created by devming on 2021/11/25.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public struct MyBrandRequest: Encodable {
    var engName: String
    var korName: String
    var siteUrl: String
    
    enum CodingKeys: String, CodingKey, Encodable {
        case engName = "en_name"
        case korName = "name"
        case siteUrl = "site_url"
    }
}
