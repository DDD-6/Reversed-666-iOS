//
//  BrandModelDTO.swift
//  Repository
//
//  Created by cado.avo on 2021/11/07.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Moya

//public struct Brand
public struct BookmarkBrandModelDTO: Codable {
    
    public var id: Int?
    public var title: String?
    public var subTitle: String?
    public var brandLink: String?
    public var imageName: String?
    public var logoImage: String?
    public var category: Category?
    
    public enum Category: String, CaseIterable, Codable {
        case shoes = "Shoes"
        case accesary = "Accesary"
        case clothes = "Clothes"
    }
}
