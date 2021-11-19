//
//  WebViewLikeBottomSheet.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import BottomSheet

struct ProductCategoryModel: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct WebViewLikeBottomSheet: View {
    
    @ObservedObject
    var viewModel = WebViewLikeBottomSheetViewModel()
//    var bookmarkList: [ProductCategory]
    
    @Binding var bottomSheetPosition: BottomSheetPosition
    
    var body: some View {
        return ZStack {
            VStack {
                // 상단 툴바
                HStack {
                    Button {
                        bottomSheetPosition = .hidden
                        
                    } label: {
                        Image("Close")
                    }
                    Spacer()
                    Text("폴더 선택")
                    Spacer()
                    Button {
                        viewModel.add()
                    } label: {
                        Image("folder-plus")
                    }
                }
                .padding(.size3)
                
                List {
                    ForEach(viewModel.bookmarkList, id: \.id) { item in
                        LazyHStack {
                            Image(item.name)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .scaledToFit()
                                .padding()
                            Text(item.name)
                            Spacer()
                        }
                    }
                }
                .listStyle(GroupedListStyle())
                
                Spacer()
            }
        }
        .background(.white)
    }
}

struct WebViewLikeBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        return WebViewLikeBottomSheet(
            bottomSheetPosition: .constant(.hidden)
        )
    }
}

