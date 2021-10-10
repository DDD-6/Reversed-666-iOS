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
    var brand: Brand?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(brand?.title ?? "")
                .font(.subheadline)
                .padding(EdgeInsets(top: .zero,
                                    leading: .zero,
                                    bottom: .size1,
                                    trailing: .zero))
            Text(brand?.subTitle ?? "")
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(EdgeInsets(top: .size2,
                            leading: .size2,
                            bottom: .zero,
                            trailing: .zero))
    }
}

struct MainBigCardView: View {
    var brand: Brand?
    
    var body: some View {
        ZStack(alignment: Alignment.topLeading, content: {
            Image("cityGuide")
            MainBigCardTitleView(brand: brand)
        })
        .padding()
    }
}

struct MainBigCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandData()
        
        return MainBigCardTitleView(brand: viewModel.mainBrand)
    }
}

struct MainBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandData()
        
        return MainBigCardView(brand: viewModel.mainBrand)
    }
}
