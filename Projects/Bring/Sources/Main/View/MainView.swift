//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            List {
                
                MainBigCardView(modelData: modelData.brandData)
                    .background(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                LikeBrandRow(categoryName: "현재 인기 브랜드 or 좋아요한 브랜드", items: modelData.brandDatas)
                
            }
            .searchable(text: $searchText)
            .listStyle(InsetListStyle())
            .navigationTitle("Title")
            .toolbar {
                
                Button {
                    print("Button is tapped")
                } label: {
                    Image("Search")
                }
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ModelData())
    }
}
