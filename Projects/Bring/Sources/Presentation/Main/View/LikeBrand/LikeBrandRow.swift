//
//  LikeBrandRow.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct LikeBrandRow: View {
    
    var brands: [Brand]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("현재 인기 브랜드 or 좋아요한 브랜드")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // self.items가 identifiable이 되있지 않으면 ForEach에서 init을 해주어야 한다.
                    ForEach(brands) { brand in
                        NavigationLink(
                            destination: Text("not implemented")) {
                            LikeBrandItem(brand: brand)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct LikeBrandRow_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        viewModel.fetchBrandDataAll()
        
        return LikeBrandRow(brands: viewModel.brandList ?? [Brand]()
        )
    }
}
