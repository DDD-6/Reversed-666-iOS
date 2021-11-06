//
//  BookmarkSegmentContentView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BookmarkSegmentContentView: View {
    
    @Binding var state: BrandStateSegment
    @EnvironmentObject private var modelData: ModelData
    
    var body: some View {
        switch state {
        case .product:
            VStack {
                Text("여기는 구현해야하는 녀석들")
                
                    List {
                        ForEach(modelData.brandDatas) { datas in
                            ZStack {
                                NavigationLink(destination: Text("haha") ) { EmptyView() }
                                .opacity(0.0)
                                .buttonStyle(PlainButtonStyle())
                                ProductFolderCardView(folderData: datas)
                                    .aspectRatio(3/2, contentMode: .fill)
                            }
                            
                        }
                    }
                    .navigationBarHidden(true)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .brand:
            VStack {
                BrandView()
                    .navigationBarHidden(true)
                    .environmentObject(modelData)
            }
        }
    }
}
