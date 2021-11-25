//
//  MainBrandCardView.swift
//  Bring
//
//  Created by devming on 2021/10/14.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct MainBrandCardView: View {
    var delegate: MainEventDelegate?
    var brand: Brand
    
    var body: some View {
        GeometryReader { metrics in
            let width = metrics.size.width
            let height = width * 0.9
            
            VStack {
                ZStack {
                    BringShapeView(width: width * 0.9,
                                   height: height)
                    
                    ZStack {
                        AsyncImage(url: URL(string: brand.thumbnailUrl)) { phase in
                            switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: width * 0.9 - .size2,
                                               height: height - .size2)
                                case .failure:
                                    Image(systemName: "photo")
                                @unknown default:
                                    Image(systemName: "photo")
                            }
                        }
                        .clipped()
                        .cornerRadius(width * 0.5,
                                      corners: [.topLeft,
                                                .topRight])
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Circle()
                                    .strokeBorder(.white, lineWidth: 1)
                                    .background(AsyncCircularImageView(imageUrl: brand.logoImageUrl, size: .size13))
                                    .clipShape(Circle())
                                    .frame(width: .size13, height: .size13, alignment: .center)
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: .size4, trailing: .size4))
                            }
                        }
                    }
                    .frame(width: width * 0.9 - CGFloat.size5,
                           height: height - CGFloat.size5,
                           alignment: .center)
                }
                
                MainBrandTitleView(delegate: delegate, brand: brand)
                    .frame(width: width * 0.9,
                           height: width * 0.2)
            }
        }
        .frame(alignment: .center)
        .scaledToFit()
    }
}

struct MainBrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchBrandData()
        
        return MainBrandCardView(brand: viewModel.mainBrands.first!)
    }
}
