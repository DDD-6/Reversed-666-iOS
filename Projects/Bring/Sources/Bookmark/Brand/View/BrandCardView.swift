//
//  BrandCardView.swift
//  Bring
//
//  Created by apple on 2021/10/03.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandCardView: View {
    
    @EnvironmentObject private var model: ModelData
    @State private var searchString: String = ""
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Spacer()
                    Text("최신순")
                }
                Text("BookMark")
                Text("BookMark")
                Text("BookMark")
            }
            .searchable(text: $searchString, placement: .sidebar) {
                ForEach(model.brandDatas) { suggestion in
                    Text(suggestion.title).searchCompletion(suggestion.title)
                }
            }
        }
    }
}

struct BrandCardView_Previews: PreviewProvider {
    static var previews: some View {
        BrandCardView()
            .environmentObject(ModelData())
    }
}
