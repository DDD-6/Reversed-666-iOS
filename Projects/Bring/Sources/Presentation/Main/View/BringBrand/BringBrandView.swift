//
//  BringBrandView.swift
//  Bring
//
//  Created by devming on 2021/11/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct BringBrandView: View {
    var brands: [Brand]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("브링한 브랜드")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // self.items가 identifiable이 되있지 않으면 ForEach에서 init을 해주어야 한다.
                    ForEach(brands) { brand in
                        NavigationLink(
                            destination: Text("not implemented")) {
                                PopularBrandItem(brand: brand)
                            }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct BringBrandView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(serviceManager: BrandServiceManagerMock())
        viewModel.fetchBringBrands()
        
        return BringBrandView(brands: viewModel.bringBrands)
    }
}
