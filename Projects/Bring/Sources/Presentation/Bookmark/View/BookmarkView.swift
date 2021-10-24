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
        
        VStack {
            
            BookmarkTitleView()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            BookmarkSegmentView(segmentState: $state)
            
            BookmarkSegmentContentView(state: $state)
                .environmentObject(modelData)
            
            Spacer()
        }
    }
}


struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
            .environmentObject(ModelData())
    }
}
