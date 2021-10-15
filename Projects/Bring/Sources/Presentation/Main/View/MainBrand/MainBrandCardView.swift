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
            let height = metrics.size.height
            
            ZStack {
                Rectangle()
                    .frame(width: width, height: height, alignment: .center)
                
                Image(brand.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width * 0.8, height: height, alignment: .center)
                    .clipShape(Ellipse())
                
                VStack {
                    HStack {
                        Image(brand.imageName)
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .topLeading)
                        Spacer()
                        Text(brand.name)
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            print("Bookmarked!")
                        } label: {
                            Image("bring")
                        }

                    }
                    .padding(16)
                    
                    Spacer()
                    
                    VStack {
                        Text(brand.name)
                            .font(.body)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        Text(brand.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: .size2, leading: 0, bottom: 0, trailing: 0))
                        Text(brand.brandLink)
                            .font(.callout)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: .size2, leading: 0, bottom: 0, trailing: 0))
                    }
                    .padding(.size3)
                }
            }
            .cornerRadius(.size1)
            .frame(width: width, height: height, alignment: .center)
        }
    }
}


struct MainBrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandData()
        
        return MainBrandCardView(brand: viewModel.mainBrand!)
    }
}
