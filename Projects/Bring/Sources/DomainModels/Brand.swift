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
    typealias DTOType = BrandModelDTO
    
    init() { }
    
    var id: Int = -1
    var name: String = ""
    var subTitle: String = ""
    var brandLink: String = ""
    
    var imageName: String = ""
    var logoImage: String = ""
//    var image: Image {
//        Image(imageName)
//    }
    
    var category: ProductCategory? = nil
    
    static func from(dtoModel: DTOType) -> Self {
        func convert(from category: BrandModelDTO.Category) -> ProductCategory {
            switch category {
                case .shoes:
                    return .shoes
                case .accesary:
                    return .accesary
                case .clothes:
                    return .clothes
            }
        }
        
        var brand = Brand()
        brand.id = dtoModel.id ?? -1
        brand.name = dtoModel.title ?? ""
        brand.subTitle = dtoModel.subTitle ?? ""
        brand.brandLink = dtoModel.brandLink ?? ""
        brand.imageName = dtoModel.imageName ?? ""
        brand.logoImage = dtoModel.logoImage ?? ""
        if let category = dtoModel.category {
            brand.category = convert(from: category)
        }
        return brand
    }
    
//    static var `default` = BrandModel(
//        id: 1,
//        title: "default Title",
//        subTitle: "default SubTitle",
//        brandLink: "www.naver.com",
//        imageName: "cityGuide",
//        category: .shoes)
//
//    static var mockDatas = [
//        BrandModel(
//            id: 1,
//            title: "Title1",
//            subTitle: "Subtitle1",
//            brandLink: "www.naver.com",
//            imageName: "cityGuide",
//            category: .shoes
//        ),
//        BrandModel(
//            id: 2,
//            title: "Title2",
//            subTitle: "Subtitle2",
//            brandLink: "www.google.com",
//            imageName: "montreal",
//            category: .accesary
//        ),
//        BrandModel(
//            id: 3,
//            title: "Title3",
//            subTitle: "Subtitle3",
//            brandLink: "www.yahoo.com",
//            imageName: "toronto",
//            category: .clothes
//        )
//    ]
}
