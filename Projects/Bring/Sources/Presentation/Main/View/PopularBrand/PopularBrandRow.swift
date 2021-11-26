//
//  PopularBrandRow.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct PopularBrandRow: View {
    
    var delegate: MainEventDelegate?
    var brands: [Brand]
    @State var presentedAsModal: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text("현재 인기 브랜드")
                .font(.headline)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(Array(zip(brands.indices, brands)), id: \.0) { (index, brand) in
                        Button {
                            presentedAsModal = true
                        } label: {
                            ZStack {
                                PopularBrandItemView(
                                    delegate: delegate,
                                    brand: brand
                                )
                                    .fullScreenCover(isPresented: $presentedAsModal) {
                                        MainDetailView(
                                            url: brand.brandLink,
                                            title: brand.name,
                                            presentedAsModal: $presentedAsModal
                                        )
                                    }
                                
                                VStack {
                                    HStack {
                                        HStack(alignment: .bottom) {
                                            Spacer()
                                            let rank = index + 1
                                            Text(rank.description)
                                                .font(BringFontStyle.heading0.font)
                                                .bold()
                                                .foregroundColor(Color("black00"))
                                                .lineLimit(1)
                                            Spacer()
                                        }
                                        .frame(width: 40, height: 30)
                                        .background(Color("brandColor"))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct PopularBrandRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchPopularBrands()
        
        return PopularBrandRow(brands: viewModel.popularBrands)
    }
}
