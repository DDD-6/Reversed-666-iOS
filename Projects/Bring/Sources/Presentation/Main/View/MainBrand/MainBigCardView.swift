//
//  MainBigCardView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Repository

struct MainBigCardTitleView: View {
    var brand: BrandModel?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(brand?.title ?? "").font(.title2)
            Text(brand?.subTitle ?? "")
        }
    }
}

struct MainBigCardView: View {
    @State var brand: BrandModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MainBigCardTitleView(brand: brand)
            Image("cityGuide")
        }
        .padding()
    }
}

struct MainBigCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        viewModel.fetchBrandDataAll(isMocked: true)
        
        return MainBigCardTitleView(brand: viewModel.mainBrand)
    }
}

struct MainBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
//        viewModel.fetchBrandData(isMocked: true)
        
        return MainBigCardView(brand: viewModel.mainBrand)
    }
}
