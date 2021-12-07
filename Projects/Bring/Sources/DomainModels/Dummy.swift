//
//  Dummy.swift
//  Bring
//
//  Created by devming on 2021/10/10.
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
            title: "길동이 선물주자",
            subTitle: "길동이 선물",
            brandLink: "https://store.musinsa.com/app/goods/1115974",
            imageName: "https://image.msscdn.net/images/goods_img/20190812/1115974/1115974_3_big.jpg",
            category: .shoes
        ),
        BrandModel(
            id: 2,
            title: "후드티",
            subTitle: "T-Logo Hoodie Heather Grey",
            brandLink: "https://store.musinsa.com/app/goods/2115560",
            imageName: "https://image.msscdn.net/images/goods_img/20210908/2115560/2115560_2_500.jpg",
            category: .accesary
        ),
        BrandModel(
            id: 3,
            title: "Title3",
            subTitle: "Subtitle3",
            brandLink: "www.yahoo.com",
            imageName: "cityGuide",
            category: .clothes
        ),
        BrandModel(
            id: 4,
            title: "Title4",
            subTitle: "Subtitle4",
            brandLink: "www.yahoo.com",
            imageName: "cityGuide",
            category: .accesary
        ),
        BrandModel(
            id: 5,
            title: "Title5",
            subTitle: "Subtitle5",
            brandLink: "www.yahoo.com",
            imageName: "cityGuide",
            category: .shoes
        )
    ]
}

final class ModelData: ObservableObject {
    @Published var brandDatas = BrandModel.mockDatas
    @Published var brandData = BrandModel.default

    var categories: [String: [BrandModel]] {
        Dictionary(
            grouping: brandDatas,
            by: { $0.category.rawValue }
        )
    }
}
