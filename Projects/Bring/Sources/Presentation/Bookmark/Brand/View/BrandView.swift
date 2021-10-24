//
//  BrandView.swift
//  Bring
//
//  Created by apple on 2021/10/03.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandView: View {
    @EnvironmentObject private var model: ModelData
    @State private var searchString: String = ""
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 40), spacing: 0), count: 3)
        
        VStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        
                        ForEach(model.brandDatas) { data in
                            BrandCardView(brandData: data)
                                .aspectRatio(112/144,
                                             contentMode: .fill)
                        }
                    }.font(.largeTitle)
                }
                
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView()
            .environmentObject(ModelData())
    }
}

