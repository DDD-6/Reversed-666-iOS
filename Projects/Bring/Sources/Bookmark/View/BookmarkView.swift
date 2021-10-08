//
//  BookmarkView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

@frozen
enum EditState {
    case edit
    case normal
}

struct BookmarkView: View {
    @EnvironmentObject private var modelData: ModelData
    @State private var state: BrandStateSegment = .product
    @State private var editState: EditState = .normal
    
    var body: some View {
        
        NavigationView {
            VStack {
                BookmarkSegmentView(segmentState: $state)
                .padding()
                
                List {
                    ForEach(modelData.brandDatas) { datas in
                        ProductFolderView(folderData: datas)
                            .aspectRatio(3/2, contentMode: .fill)
                    }
                }
                .navigationTitle("동길님의 블로그")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    Button {
                        print("huhu")
                    } label: {
                        Text("hhu")
                    }
                    
                })
                        
            }
        }
        
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
            .environmentObject(ModelData())
    }
}
