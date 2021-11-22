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
    @State private var isPresented = false
    
    enum Constant {
        enum Layout {
            static let imageRadius: CGFloat = 10
            static let paddingSize: CGFloat = 14
        }
        static let gray = Color("gray01") // 나중에 색깔 변환
    }
    
    var body: some View {
        
        GeometryReader { geo in
            VStack {
                CircleImage(image: brandData.image.resizable())
                    .padding(Constant.Layout.paddingSize)
                Text(brandData.title)
                    .font(BringFontStyle.textL.font)
                    .padding(.bottom, 13)
            }
            .background(Constant.gray)
            .border(.black, width: 0.5)
            .onTapGesture {
                isPresented.toggle()
            }
        }.fullScreenCover(isPresented: $isPresented) {
            MainDetailView(url: brandData.brandLink, presentedAsModal: $isPresented)
        }
        
    }
}

struct BrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrandCardView(brandData: ModelData().brandData)
    }
}
