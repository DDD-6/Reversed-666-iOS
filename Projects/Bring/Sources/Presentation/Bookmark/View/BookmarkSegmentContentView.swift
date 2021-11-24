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
            ProductFolderView()
                .navigationBarHidden(true)
                .environmentObject(modelData)
        case .brand:
            VStack {
                BrandView()
                    .navigationBarHidden(true)
                    .environmentObject(modelData)
            }
        }
    }
}
