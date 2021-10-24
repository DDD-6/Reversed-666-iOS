//
//  BookmarkTitleView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BookmarkTitleView: View {
    var body: some View {
        HStack {
            Text("북마크")
                .font(.system(size: 30, weight: .bold, design: .default))
            Spacer()
            Button("설정") {
                print("haha")
            }
        }
    }
}

struct BookmarkTitleView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkTitleView()
    }
}
