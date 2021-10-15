//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var searchText: String = ""
    
    @ObservedObject var viewModel = MainViewModel(isStub: true)
    
    var body: some View {
//        let mainBrand = viewModel.mainBrand ?? Brand()
        let brandList = viewModel.brandList ?? [Brand]()
        
        return NavigationView {
            List {
                MainBracketsMaskView(brands: brandList)
                    .background(Color.gray)
                    .cornerRadius(16)
                    .clipped()
                LikeBrandRow(brands: brandList)
            }
            .searchable(text: $searchText)
            .listStyle(InsetListStyle())
            .navigationTitle("Title")
            .toolbar {
                Button {
                    viewModel.fetchBrandData()
                    viewModel.fetchBrandDataAll()
                } label: {
                    Image("Search")
                }
            }
            .onAppear {
                viewModel.fetchBrandData()
                viewModel.fetchBrandDataAll()
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
