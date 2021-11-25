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
    
    var brands: [Brand]
    @State var presentedAsModal: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text("현재 인기 브랜드")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 0) {
                    ForEach(brands) { brand in
                        Button {
                            presentedAsModal = true
                        } label: {
                            PopularBrandItem(brand: brand)
                                .fullScreenCover(isPresented: $presentedAsModal) {
                                    MainDetailView(
                                        url: brand.brandLink,
                                        presentedAsModal: $presentedAsModal
                                    )
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
