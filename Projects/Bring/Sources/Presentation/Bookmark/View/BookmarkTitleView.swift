//
//  BookmarkTitleView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BookmarkTitleView: View {
    
    @Binding var segmentState: BrandStateSegment
    
    var body: some View {
        HStack {
            Text("북마크")
                .font(.system(size: 30, weight: .bold, design: .default))
            Spacer()
            Button {
                print("구현해야함")
            } label: {
                if segmentState == .brand {
                    Image("Scissor")
                        .frame(width: 20.25, height: 16.49, alignment: .center)
                } else {
                    Image("folder-plus")
                        .frame(width: 20, height: 18, alignment: .center)
                }
            }
        }
    }
}

//struct BookmarkTitleView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        BookmarkTitleView(isBrand: $false)
//    }
//}
