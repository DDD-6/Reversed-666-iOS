//
//  MainBracketsMaskView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Repository

struct MainBracketsMaskView: View {
    var brands: [Brand]?
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = width * 0.9
        ForEach(brands!) { brand in
            MainBrandCardView(brand: brand)
                .frame(width: width,
                       height: height + .size4 + 75,
                       alignment: .center)
        }
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
