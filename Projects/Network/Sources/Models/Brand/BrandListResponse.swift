//
//  BrandModelDTO.swift
//  Repository
//
//  Created by devming on 2021/09/29.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya
import Alamofire

// TODO: 이름 BrandListResponse로 변경 예정
public struct BrandListResponse: Codable {
    public var id: Int?
    // TODO: 여기 이름 바꾸기
    /// 영어명...
    public var engName: String?
    /// 한국어 명 ...
    public var korName: String?
    /// 웹뷰 이동 링크
    public var brandLink: String?
    /// thumbnail
    public var thumbnailUrl: String?
    /// 브랜드 로고 이미지
    public var logoImageUrl: String?
    /// 지금 안씀
    public var category: Category?
    public var isLiked: Bool?
    
    public enum Category: String, CaseIterable, Codable {
        case shoes = "Shoes"
        case accesary = "Accesary"
        case clothes = "Clothes"
    }
    
    enum CodingKeys: String, CodingKey, Decodable {
        case id
        case korName = "name"
        case engName = "en_name"
        case brandLink = "site_url"
        case logoImageUrl = "logo_url"
        case thumbnailUrl = "Img_url"
        case isLiked = "is_liked"
    }
}
