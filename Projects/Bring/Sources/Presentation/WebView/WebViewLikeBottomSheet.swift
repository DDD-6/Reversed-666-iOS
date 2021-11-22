//
//  WebViewLikeBottomSheet.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import BottomSheet
import Network

struct ProductCategoryModel: Identifiable {
    var id: UUID = UUID()
    var name: String
}

struct WebViewLikeBottomSheet: View {
    
    @ObservedObject
    var viewModel = WebViewLikeBottomSheetViewModel(
        serviceManager: FolderServiceManagerImpl()
    )
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
                        viewModel.createFolder(
                            name: "기본 구조",
                            description: ""
                        )
                    } label: {
                        Image("folder-plus")
                    }
                }
                .padding(.size3)
                
                List {
                    ForEach(viewModel.folders) { item in
                        Button {
                            bottomSheetPosition = .hidden
                        } label: {
                            LazyHStack {
                                AsyncImage(url: URL(string: item.folderImageUrl))
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                    .padding()
                                Text(item.folderName)
                                Spacer()
                            }
                        }

                    }
                }
                .listStyle(PlainListStyle())
                
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

