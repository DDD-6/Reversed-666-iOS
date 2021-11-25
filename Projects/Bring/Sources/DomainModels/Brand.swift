//
//  BrandModel.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import SwiftUI
import Network

// 임시로 만든 모델
enum ProductCategory: String, CaseIterable {
    case shoes = "Shoes"
    case accesary = "Accesary"
    case clothes = "Clothes"
    
}

struct Brand: DomainModel, Hashable, Identifiable {
    typealias ResponseType = BrandListResponse
    
    var id: Int = -1
    var name: String = ""
    var engName: String = ""
    var brandLink: String = ""
    
    var thumbnailUrl: String = ""
    var logoImageUrl: String = ""
    var category: ProductCategory? = nil
    
    var isLiked: Bool = false
    
    init() { }
    init(from response: ResponseType) {
        func convert(from category: BrandListResponse.Category) -> ProductCategory {
            switch category {
                case .shoes:
                    return .shoes
                case .accesary:
                    return .accesary
                case .clothes:
                    return .clothes
            }
        }
        
        self.id = response.id ?? -1
        self.name = response.korName ?? ""
        self.engName = response.engName ?? ""
        self.brandLink = response.brandLink ?? ""
        self.thumbnailUrl = response.thumbnailUrl ?? ""
        self.logoImageUrl = response.logoImageUrl ?? ""
        if let category = response.category {
            self.category = convert(from: category)
        }
        self.isLiked = response.isLiked ?? false
    }
}

struct BrandLiked: DomainModel, Hashable, Identifiable {
    typealias ResponseType = BrandLikeListResponse
    
    var id: Int = -1
    var name: String = ""
    var engName: String = ""
    var brandLink: String = ""
    
    var thumbnailUrl: String = ""
    var logoImageUrl: String = ""
    
    var isLiked: Bool = false
    
    init(from response: ResponseType) {
        
        id = response.bringBasicBrand?.id ?? -1
        name = response.bringBasicBrand?.korName ?? ""
        engName = response.bringBasicBrand?.engName ?? ""
        brandLink = response.bringBasicBrand?.brandLink ?? ""
        thumbnailUrl = response.bringBasicBrand?.thumbnailUrl ?? ""
        logoImageUrl = response.bringBasicBrand?.logoImageUrl ?? ""
        isLiked = response.isAdded ?? false
    }
}
