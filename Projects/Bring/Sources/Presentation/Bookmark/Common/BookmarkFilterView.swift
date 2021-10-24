//
//  BookmarkFilterView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

enum SortFilterType {
    case recent
    case ABC
}

struct BookmarkFilterView: View {
    
    var valueCount = 0
    
    var body: some View {
        HStack {
            Text("")
            Spacer()
            Text("haha")
        }
    }
}

struct BookmarkFilterView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkFilterView()
    }
}
