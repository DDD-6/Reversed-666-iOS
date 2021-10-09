//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
//    @EnvironmentObject var modelData: ModelData
    @State var searchText: String = ""
    
    @ObservedObject var viewModel = MainViewModel(isStub: true)
    
    var body: some View {
        let mainBrand = viewModel.mainBrand ?? BrandModel()
        let brandList = viewModel.brandList ?? [BrandModel]()
        
        return NavigationView {
            List {
                MainBigCardView(brand: mainBrand)
                    .background(Color.gray)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .cornerRadius(16)
                    .clipped()
                LikeBrandRow(brands: brandList)
            }
//            .searchable(text: $searchText)
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
//        MainView().environmentObject(ModelData())
    }
}
