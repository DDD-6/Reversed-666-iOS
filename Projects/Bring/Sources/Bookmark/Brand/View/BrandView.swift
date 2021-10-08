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
        NavigationView {
            List {
                HStack {
                    Spacer()
                    Text("최신순")
                }
                
                content
            }
            .navigationTitle("testing")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchString, placement: .sidebar) {
                ForEach(model.brandDatas) { suggestion in
                    Text(suggestion.title).searchCompletion(suggestion.title)
                }
            }
        }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Text("Ingredients.menu",
                 tableName: "Ingredients",
                 comment: "Ingredients in a smoothie. For languages that have different words for \"Ingredient\" based on semantic context.")
                .font(Font.title).bold()
                .foregroundStyle(.secondary)
            
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80, maximum: 130), spacing: 16, alignment: .top)], alignment: .center, spacing: 16) {
                ForEach(model.brandDatas) { data in
                    
                    let ingredient = data.image
                    let presenting = true
                    
                    BrandCardView(brandData: data)
                }
            }
        }
        .padding()
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

