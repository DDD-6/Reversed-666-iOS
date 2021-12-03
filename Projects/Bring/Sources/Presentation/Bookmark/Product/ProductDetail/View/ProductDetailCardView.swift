//
//  ProductDetailCardView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductDetailCardView: View {
    
    enum Constant: CGFloat {
        case size = 150
    }
    let index: Int
    init(tempIndex: Int) {
        index = tempIndex
    }
    var thumbnailUrls: [String] = [
        "https://image.msscdn.net/images/goods_img/20210908/2115560/2115560_2_500.jpg",
        "https://image.msscdn.net/images/goods_img/20190812/1115974/1115974_3_big.jpg",
        "https://image.msscdn.net/images/goods_img/20210112/1744960/1744960_3_500.jpg",
        "https://image.msscdn.net/images/goods_img/20210813/2064478/2064478_3_500.jpg",
        "https://image.msscdn.net/images/goods_img/20200225/1322019/1322019_8_500.jpg"
    ]
    var brandUrl: [String] = [
        "https://image.msscdn.net/display/images/2021/06/25/196e5d0096454623911ab0e4bfaedd51.png",
        "https://image.msscdn.net/display/images/2021/06/25/6e4431a19154401982ea35a9c040f320.png",
        "https://image.msscdn.net/images/brand/2019021211221000000099990.png",
        "https://image.msscdn.net/mfile_s01/_brand/free_medium/lafudgestore.png?202110061655",
        "https://image.musinsa.com/images/brand/2020050812382500000027035.png"
    ]
    
    var body: some View {
        
        ZStack {
            //AsyncImage(url: URL(string: "https://your_image_url_address"))
            // iOS15이상이면 이렇게 바로 쓸수 있는것같네요
            
            AsyncImage(url: URL(string: thumbnailUrls[index])){ phase in
                switch phase {
                    case .empty:
                        ProgressView()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constant.size.rawValue,
                                   height: Constant.size.rawValue)
                    case .success(let image):
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constant.size.rawValue,
                                   height: Constant.size.rawValue)
                    default:
                        Image(systemName: "photo")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constant.size.rawValue,
                                   height: Constant.size.rawValue)
                }
            }
            Circle()
                .strokeBorder(.white, lineWidth: 1)
                .background(AsyncCircularImageView(imageUrl: brandUrl[index], size: .size13))
                .clipShape(Circle())
                .frame(width: .size13, height: .size13)
                .padding(EdgeInsets(top: .size4, leading: 0, bottom: .size4, trailing: 0))
        }
    }
}

//struct BrandOverlay: View {
//    var brandURL: String? = nil
//
//    var body: some View {
//        ZStack(alignment: .topTrailing, content: {
//            Rectangle()
//                .foregroundColor(.clear)
//            Image(brandURL ?? "toronto")
//                .resizable()
//                .modifier(CircleImageModifier())
//                .frame(width: 36, height: 36, alignment: .center)
//                .padding()
//        })
//
//    }
//}
//
//struct BrandOverlay_Previews: PreviewProvider {
//    static var previews: some View {
//        BrandOverlay()
//    }
//}
//
//struct ProductDetailCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailCardView()
//    }
//}
