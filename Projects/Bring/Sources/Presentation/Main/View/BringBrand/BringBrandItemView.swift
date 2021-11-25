//
//  BringBrandItemView.swift
//  Bring
//
//  Created by devming on 2021/11/25.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct BringBrandItemView: View {
    enum Constant: CGFloat {
        case size = 60
    }
    
    @State var brand: BrandLiked
    
    var body: some View {
        LazyVStack(alignment: .center) {
            AsyncImage(url: URL(string: brand.imageName)){ phase in
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
                    case .failure:
                        Image(systemName: "photo")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constant.size.rawValue,
                                   height: Constant.size.rawValue)
                    @unknown default:
                        Image(systemName: "photo")
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Constant.size.rawValue,
                                   height: Constant.size.rawValue)
                }
            }
            .clipped()
            .cornerRadius(Constant.size.rawValue / 2)
            
            Text(brand.name)
                .foregroundColor(Color("black00"))
                .font(BringFontStyle.textS.font)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: false)
                .lineLimit(2)
                .frame(width: Constant.size.rawValue, height: 16)
        }
        .padding(5)
    }
}

struct BringBrandItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchBringBrands()
        return BringBrandItemView(brand: viewModel.bringBrands.first!)
    }
}
