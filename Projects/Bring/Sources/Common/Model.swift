//
//  Model.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import SwiftUI

// 임시로 만든 모델

struct BrandModel: Hashable, Identifiable {
    var id: Int
    var title: String
    var subTitle: String
    var brandLink: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var category: Category
    enum Category: String, CaseIterable {
        case shoes = "Shoes"
        case accesary = "Accesary"
        case clothes = "Clothes"
    }
    
    static let `default` = BrandModel(
        id: 1,
        title: "default Title",
        subTitle: "default SubTitle",
        brandLink: "www.naver.com",
        imageName: "cityGuide",
        category: .shoes)
    
    static let mockDatas = [
        BrandModel(
            id: 1,
            title: "Title1",
            subTitle: "Subtitle1",
            brandLink: "www.naver.com",
            imageName: "cityGuide",
            category: .shoes
        ),
        BrandModel(
            id: 2,
            title: "Title2",
            subTitle: "Subtitle2",
            brandLink: "www.google.com",
            imageName: "montreal",
            category: .accesary
        ),
        BrandModel(
            id: 3,
            title: "Title3",
            subTitle: "Subtitle3",
            brandLink: "www.yahoo.com",
            imageName: "toronto",
            category: .clothes
        )
    ]
}
