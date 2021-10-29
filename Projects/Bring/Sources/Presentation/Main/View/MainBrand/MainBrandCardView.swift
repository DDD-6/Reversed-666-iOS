//
//  MainBrandCardView.swift
//  Bring
//
//  Created by devming on 2021/10/14.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Repository

struct MainBrandCardView: View {
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
                        Image(brand.imageName)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(width * 0.4,
                                          corners: [.topLeft,
                                                    .topRight])
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Circle()
                                    .strokeBorder(.white, lineWidth: 1)
                                    .background(Image(brand.logoImage)
                                                    .resizable()
                                                    .scaledToFill())
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
                
                Spacer()
                
                MainBrandTitleView()
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
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandData()
        
        return MainBrandCardView(brand: viewModel.mainBrand!)
    }
}
