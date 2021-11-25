//
//  MainView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Network

protocol MainEventDelegate {
    func callLike(id: Int, completion: (() -> Void)?) 
}

struct MainView: View {
    
    enum Constant {
        case popularBrandsPosition
        
        var value: Int {
            switch self {
                case .popularBrandsPosition:
                    return 2
            }
        }
    }
    
    @ObservedObject
    var viewModel = MainViewModel(
        serviceManager: BrandServiceManagerImpl()
    )
    
    var body: some View {
        return NavigationView {
            ZStack {
                
                List {
                    if !viewModel.bringBrands.isEmpty {
                        BringBrandRow(brands: viewModel.bringBrands)
                    }
                    if !viewModel.mainBrands.isEmpty {
                        
                        if viewModel.mainBrands.count > Constant.popularBrandsPosition.value {
                            MainBracketsMaskView(
                                delegate: self,
                                brands: viewModel.mainBrands
                                    .prefix(
                                        upTo: Constant.popularBrandsPosition.value
                                    )
                                    .shuffled()
                            ).clipped()
                            
                            if !viewModel.popularBrands.isEmpty {
                                PopularBrandRow(
                                    delegate: self,
                                    brands: viewModel.popularBrands
                                )
                            }
                            
                            MainBracketsMaskView(
                                delegate: self,
                                brands: viewModel.mainBrands
                                    .suffix(
                                        from: Constant.popularBrandsPosition.value
                                    )
                                    .shuffled()
                            ).clipped()
                        } else {
                            if !viewModel.popularBrands.isEmpty {
                                PopularBrandRow(
                                    delegate: self,
                                    brands: viewModel.popularBrands
                                )
                            }
                        }
                    } else {
                        if !viewModel.popularBrands.isEmpty {
                            PopularBrandRow(
                                delegate: self,
                                brands: viewModel.popularBrands
                            )
                        }
                    }
                }
                .refreshable {
                    viewModel.fetchMainBrands()
                    viewModel.fetchBringBrands()
                    viewModel.fetchPopularBrands()
                }
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Image("icBringLogo")
                            Text("bring")

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
                    viewModel.fetchMainBrands()
                    viewModel.fetchBringBrands()
                    viewModel.fetchPopularBrands()
                }
                .navigationBarTitleDisplayMode(.inline)
                
//                List {
//                    if !viewModel.bringBrands.isEmpty {
//                        BringBrandRow(brands: viewModel.bringBrands)
//                    }
//                    if !viewModel.popularBrands.isEmpty {
//                        PopularBrandRow(
//                            delegate: self,
//                            brands: viewModel.popularBrands
//                        )
//                    }
//                    if !viewModel.mainBrands.isEmpty {
//                        MainBracketsMaskView(
//                            delegate: self,
//                            brands: viewModel.mainBrands
//                        )
//                            .clipped()
//                    }
//                }
//                .listStyle(PlainListStyle())
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        HStack {
//                            Image("icBringLogo")
//                            Text("bring")
//
//                            Spacer()
//                            Button {
//                                // Search
//                            } label: {
//                                Image("Search")
//                            }
//                        }
//                    }
//
//                }
//                .onAppear {
//                    viewModel.fetchMainBrands()
//                    viewModel.fetchBringBrands()
//                    viewModel.fetchPopularBrands()
//                }
//                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

extension MainView: MainEventDelegate {
    func callLike(id: Int, completion: (() -> Void)?) {
        viewModel.postLike(id: id, completion: completion)
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
