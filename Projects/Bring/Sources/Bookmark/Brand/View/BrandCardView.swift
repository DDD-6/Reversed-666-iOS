//
//  BrandCardView.swift
//  Bring
//
//  Created by apple on 2021/10/03.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandCardView: View {
    
    var brandData: BrandModel
    enum Constant {
        enum Layout {
            static let imageRadius: CGFloat = 10
            static let paddingSize: CGFloat = 5
        }
        static let skyblue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    }
    
    var body: some View {
        
            VStack {
                brandData.image
                    .cornerRadius(Constant.Layout.imageRadius)
                Text(brandData.title)
            }
            .padding(Constant.Layout.paddingSize)
            .background(Constant.skyblue)
            .cornerRadius(Constant.Layout.imageRadius)
        
    }
}

struct BrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrandCardView(brandData: ModelData().brandData)
    }
}
