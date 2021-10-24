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
            static let paddingSize: CGFloat = 14
        }
        static let skyblue = Color(red: 0.4627, green: 0.8392, blue: 1.0) // 나중에 색깔 변환
    }
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                CircleImage(image: brandData.image.resizable())
                    .padding(Constant.Layout.paddingSize)
                
                RectangleCapsule(text: brandData.title)
                    .frame(width: geo.size.width, height: 32)
                //Text(brandData.title).background(Rectangle().stroke())
            }
            .background(Constant.skyblue)
            .border(.black, width: 1.0)
        }
    }
}

struct BrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrandCardView(brandData: ModelData().brandData)
    }
}
