//
//  BringBrandRow.swift
//  Bring
//
//  Created by devming on 2021/11/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct BringBrandRow: View {
    
    var brands: [BrandLiked]
    @State var presentedAsModal: Bool = false
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text("브링한 브랜드")
                .font(.headline)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(Array(zip(brands.indices, brands)), id: \.0) { (index, brand) in
                        Button {
                            presentedAsModal = true
                        } label: {
                            ZStack {
                                BringBrandItemView(brand: brand)
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
            .frame(height: 80)
        }
    }
}

struct BringBrandView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchBringBrands()
        
        return BringBrandRow(brands: viewModel.bringBrands)
    }
}
