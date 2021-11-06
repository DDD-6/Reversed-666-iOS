//
//  ProductDetailView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        
//        let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 40), spacing: 0), count: 3)
//
//        VStack {
//            ScrollView {
//                LazyVGrid(columns: columns) {
//                    ForEach(model.brandDatas) { data in
//                        BrandCardView(brandData: data)
//                            .aspectRatio(112/144,
//                                         contentMode: .fill)
//                    }
//                }.font(.largeTitle)
//            }
//        }
        ProductDetailCardView()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
