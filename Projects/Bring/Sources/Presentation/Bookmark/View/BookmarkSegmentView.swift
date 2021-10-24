//
//  BookmarkSegment.swift
//  Bring
//
//  Created by cado.avo on 2021/10/02.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

@frozen
enum BrandStateSegment {
    case product
    case brand
}

struct BookmarkSegmentView: View {
    @Binding var segmentState: BrandStateSegment
    
    var body: some View {
        Picker("bring",
               selection: $segmentState) {
            Text("상품").tag(BrandStateSegment.product)
            Text("브랜드").tag(BrandStateSegment.brand)
        }
        .pickerStyle(.segmented)
    }
}
