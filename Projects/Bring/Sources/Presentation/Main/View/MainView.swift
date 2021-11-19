//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel(isStub: true)
    
    var body: some View {
        let brandList = viewModel.brandList ?? [Brand]()
        
        return NavigationView {
            ZStack {
                List {
                    MainBracketsMaskView(brands: brandList)
                        .clipped()
                    PopularBrandRow(brands: brandList)
                    
                    //                    MainViewDistributor(brands: brandList)
                }
                .listStyle(InsetListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("icMainTitleLogo")
                            
                            Spacer()
                            Button {
                                // Search
                            } label: {
                                Image("Search")
                            }
                        }
                    }
                    
                }
                .onAppear {
                    viewModel.fetchBrandData()
                    viewModel.fetchBrandDataAll()
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// TODO: MainView에서 데이터 리스트만 던져주면 분기에 따라 View를 반환해주는 View
//struct MainViewDistributor: View {
//    var brands: [Brand]?
//
//    var body: some View {
//        let mainBrands = brands?.map { item in
//            switch item.cardType {
//                case .brand:
//                    return MainBrandCardView(brand: item.brand)
//                case .popular:
//                    return PopularBrandRow(brands: item.brands)
//                case .bookmark:
//                    return MainBookmarkView(brands: item.brands)
//            }
//        }
//    }
//}
