//
//  LikeBrandItem.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct LikeBrandItem: View {
    var brand: Brand?

    var body: some View {
        VStack(alignment: .center) {
            Image(brand?.imageName ?? "")
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(brand?.name ?? "")
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(5)
    }
}


struct LikeBrandItem_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandData()
        
        return LikeBrandItem(brand: viewModel.mainBrand)
    }
}
