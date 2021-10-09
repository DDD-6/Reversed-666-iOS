//
//  MainBigCardView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

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
    var modelData: BrandModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            MainBigCardTitleView(
                title: modelData.title,
                subtitle: modelData.subTitle)
            Image("cityGuide")
        }
        .padding()
    }
}

struct MainBigCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainBigCardView(modelData: ModelData().brandData)
    }
}
