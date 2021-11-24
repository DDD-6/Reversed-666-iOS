//
//  ProductDetailCardView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductDetailCardView: View {
    
    var imageURL: String? = nil
    var brandURL: String? = nil
    
    var body: some View {
        
        ZStack {
            //AsyncImage(url: URL(string: "https://your_image_url_address"))
            // iOS15이상이면 이렇게 바로 쓸수 있는것같네요
            Image("montreal")
                .resizable()
                .aspectRatio(188/255,
                             contentMode: .fill)
                .overlay(BrandOverlay(brandURL: brandURL))
        }
    }
}

struct BrandOverlay: View {
    var brandURL: String? = nil
    
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            Rectangle()
                .foregroundColor(.clear)
            Image(brandURL ?? "toronto")
                .resizable()
                .modifier(CircleImageModifier())
                .frame(width: 36, height: 36, alignment: .center)
                .padding()
        })
        
    }
}

struct BrandOverlay_Previews: PreviewProvider {
    static var previews: some View {
        BrandOverlay()
    }
}

struct ProductDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailCardView()
    }
}
