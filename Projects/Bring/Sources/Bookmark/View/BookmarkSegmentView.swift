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
    @State private var state: BrandStateSegment = .product
    
    var body: some View {
        Picker("bring",
               selection: $state) {
            Text("상품")
            Text("브랜드")
        }
        .pickerStyle(.segmented)
    }
}

struct BookmarkSegment_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkSegmentView()
    }
}
