//
//  MainBracketsMaskView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

struct MainBracketsMaskView: View {
    var brands: [Brand]?
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = width * 0.9
        ForEach(brands!) { brand in
            NavigationLink {
                MainDetailView(url: brand.brandLink)
            } label: {
                Button { } label: {
                    MainBrandCardView(brand: brand)
                        .frame(width: width,
                               height: height + .size5 * 8,
                               alignment: .center)
                }
            }
        }
        .listRowSeparator(.hidden)
        
    }
}

struct MainBracketsMaskView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel(isStub: true)
        viewModel.fetchBrandDataAll()
        return MainBracketsMaskView(brands: viewModel.brandList)
            .frame(width: 300, height: 450, alignment: .center)
    }
}
