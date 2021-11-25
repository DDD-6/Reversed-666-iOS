//
//  PopularBrandItemView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct PopularBrandItemView: View {
    
    enum Constant: CGFloat {
        case size = 150
    }
    
    var delegate: MainEventDelegate?
    @State var brand: Brand

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
            .cornerRadius(75)
            .border(
                width: 1,
                edges: Edge.allCases,
                color: Color("black00")
            )
            
            HStack {
                Text(brand.engName)
                    .foregroundColor(Color("black00"))
                    .font(BringFontStyle.brandM.font)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: false)
                    .lineLimit(2)
                Text(brand.name)
                    .foregroundColor(Color("black00"))
                    .font(BringFontStyle.textM.font)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: false)
                    .lineLimit(2)
                
                Button {
                    delegate?.callLike(id: brand.id) {
                        brand.isLiked.toggle()
                    }
                } label: {
                    Image(brand.isLiked
                          ? "icHeartFill"
                          : "icHeartLine")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .padding()
                }

            }
            .frame(width: Constant.size.rawValue, height: 40)
        }
        .padding(5)
    }
}


struct PopularBrandItem_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchPopularBrands()
        
        return PopularBrandItemView(brand: viewModel.popularBrands.first!)
    }
}
