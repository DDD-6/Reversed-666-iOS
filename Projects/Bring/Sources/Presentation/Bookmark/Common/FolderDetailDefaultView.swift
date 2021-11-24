//
//  FolderDetailDefaultView.swift
//  Bring
//
//  Created by cado.avo on 2021/11/14.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct FolderDetailDefaultView: View {
    
    struct Constant {
        static let title = "브링한 상품이 없습니다."
        static let subTitle = "좋아하는 상품을 브링해보세요!"
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 12, content: {
            Image("default_image")
            VStack(alignment: .center, spacing: 8) {
                Text(Constant.title)
                    .font(BringFontStyle.textXL.font)
                    .foregroundColor(Color("gray05"))
                    
                Text(Constant.subTitle)
                    .font(BringFontStyle.textM.font)
                    .foregroundColor(Color("gray03"))
            }
        })
    }
}

struct FolderDetailDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetailDefaultView()
    }
}
