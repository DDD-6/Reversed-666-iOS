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
public enum ProductCategory: String, CaseIterable {
    case shoes = "Shoes"
    case accesary = "Accesary"
    case clothes = "Clothes"
    
}

public struct Brand: DomainModel, Hashable, Identifiable {
    public typealias ResponseType = BrandListResponse
    
    public var id: Int = -1
    public var name: String = ""
    public var engName: String = ""
    public var brandLink: String = ""
    
    public var thumbnailUrl: String = ""
    public var logoImageUrl: String = ""
    public var category: ProductCategory? = nil
    
    public var isLiked: Bool = false
    
    public init() { }
    public init(from response: ResponseType) {
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

public struct BrandLiked: DomainModel, Hashable, Identifiable {
    public typealias ResponseType = BrandLikeListResponse
    
    public var id: Int = -1
    public var name: String = ""
    public var engName: String = ""
    public var brandLink: String = ""
    
    public var thumbnailUrl: String = ""
    public var logoImageUrl: String = ""
    
    public var isLiked: Bool = false
    
    public init(from response: ResponseType) {
        
        id = response.bringBasicBrand?.id ?? -1
        name = response.bringBasicBrand?.korName ?? ""
        engName = response.bringBasicBrand?.engName ?? ""
        brandLink = response.bringBasicBrand?.brandLink ?? ""
        thumbnailUrl = response.bringBasicBrand?.thumbnailUrl ?? ""
        logoImageUrl = response.bringBasicBrand?.logoImageUrl ?? ""
        isLiked = response.isAdded ?? false
    }
}
