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
    case ganada 
    
    var type: String {
        switch self {
        case .recent: return "최신순"
        case .ABC: return "ABC순"
        case .ganada: return "가나다순"
        }
    }
}

struct BookmarkFilterView: View {
    
    var valueCount = 0
    var sortType: SortFilterType = .recent
    
    var body: some View {
        HStack {
            Text("총") + Text(" \(valueCount)").foregroundColor(Color("brandColor")) + Text("개의 브랜드")
            Spacer()
            Button(sortType.type) {
                print("test")
            }
        }.padding(16)
    }
}

struct BookmarkFilterView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkFilterView()
    }
}
