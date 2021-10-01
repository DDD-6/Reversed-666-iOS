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
    
    @State var title: String
    @State var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.title2)
            Text(subtitle)
        }
    }
}

struct MainBigCardView: View {
    @State var modelData: BrandModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
//            MainBigCardTitleView(
//                title: $modelData.title,
//                subtitle: $modelData.subTitle)
            Image("cityGuide")
        }
        .padding()
    }
}

struct MainBigCardTitleView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        let mock: BrandModel = viewModel.mockBrandDatas()!
        
        MainBigCardTitleView(title: mock.title,
                             subtitle: mock.subTitle)
    }
}

struct MainBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainViewModel()
        let mock: BrandModel = viewModel.brand!
        MainBigCardView(modelData: mock)
    }
}
