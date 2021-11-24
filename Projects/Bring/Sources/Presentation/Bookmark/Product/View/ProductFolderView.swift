//
//  ProductFolderView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductFolderView: View {
    
    @EnvironmentObject private var model: ModelData
    
    var body: some View {
        
        VStack {
            BookmarkFilterView(valueCount: model.brandDatas.count, sortType: .ganada)
            
            List {
                ForEach(model.brandDatas) { datas in
                    ZStack {
                        NavigationLink(destination: ProductDetailView().environmentObject(model).navigationBarHidden(true) ) {  }
                        .opacity(0.0)
                        .buttonStyle(PlainButtonStyle())
                        ProductFolderCardView(folderData: datas)
                            .aspectRatio(3/2, contentMode: .fill)
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            
        }

        
        
    }
}

struct ProductFolderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFolderView()
            .environmentObject(ModelData())
    }
}
