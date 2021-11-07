//
//  BrandAddNoticeView.swift
//  Bring
//
//  Created by cado.avo on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandAddNoticeView: View {
    
    enum Constant {
        static let noticeText = " 추가된 브랜드는 '북마크 > 브랜드' 혹은 '북마크한 브랜드'에서 보실 수 있습니다."
    }
    
    var body: some View {
        
        HStack {
            Text(Image("notice")) + Text(Constant.noticeText)
        }
        .padding(.size1)
        .background(Color("gray01"))
        
    }
}

struct BrandAddNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        BrandAddNoticeView()
    }
}
