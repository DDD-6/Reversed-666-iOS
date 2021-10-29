//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

// TODO: 여기서 사용한 Toast는 사용방법 안내를 위한 임시코드라서 지워야함
struct MainView: View, Toastable {
    
    @ObservedObject var viewModel = MainViewModel(isStub: true)
    @State var isShownToast: Bool = false
    
    var body: some View {
        let brandList = viewModel.brandList ?? [Brand]()
        let toastView = ToastView(isShownToast: $isShownToast,
                                  message: "테스트입니당")
        
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
                                toastView.showToast()
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

                // TODO: 이렇게 배치하는게 아니라 메소드 하나만으로 배치하는 방법이 없을까?
                toastView
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
