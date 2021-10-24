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

public struct BrandModelDTO: Codable {
    public var id: Int?
    public var title: String?
    public var subTitle: String?
    public var brandLink: String?
    public var imageName: String?
    public var category: Category?
    
    public enum Category: String, CaseIterable, Codable {
        case shoes = "Shoes"
        case accesary = "Accesary"
        case clothes = "Clothes"
    }
}
