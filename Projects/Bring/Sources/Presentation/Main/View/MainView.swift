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
    
    @ObservedObject var viewModel = MainViewModel()
    
    
    var body: some View {
        viewModel.fetchBrandData(isMocked: true)
        viewModel.fetchBrandDataAll(isMocked: true)
        let mainBrand = $viewModel.mainBrand.wrappedValue ?? BrandModel()
        let brandList = $viewModel.brandList.wrappedValue ?? [BrandModel]()
        
        return NavigationView {
            List {
                MainBigCardView(brand: mainBrand)
                    .background(Color.gray)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                LikeBrandRow(categoryName: "현재 인기 브랜드 or 좋아요한 브랜드", brands: brandList)
            }
//            .searchable(text: $searchText)
            .listStyle(InsetListStyle())
            .navigationTitle("Title")
            .toolbar {
                
                Button {
//                    viewModel.changeModel()
                    print("##")
                } label: {
                    Image("Search")
                }
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
