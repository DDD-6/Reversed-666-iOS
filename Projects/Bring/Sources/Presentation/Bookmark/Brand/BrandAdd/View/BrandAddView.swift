//
//  BrandAddView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

private enum Constant {
    enum Title {
        static let brandName = "브랜드 이름"
        static let address = "주소"
        static let logoImage = "로고 이미지"
        static let option = "(선택사항)"
    }
    enum Placeholder {
        static let brandPlaceHolder = "화면에 표시될 이름을 적어주세요"
        static let addressPlaceHolder = "예: https://naver.com"
    }
}

struct BrandAddView: View {
    // 추가 버튼의 flag 처리를 위해 ViewModel에서 브랜드 이름과 주소 text들을 publish해서 추가를 갖고있는지 확인해야할듯한데 combine 너무 어렵네
    
    var body: some View {
        VStack {
            BrandAddTitleView()
            BrandAddTextFieldView(title: Constant.Title.brandName, placeholder: Constant.Placeholder.brandPlaceHolder)
            BrandAddTextFieldView(title: Constant.Title.address, placeholder: Constant.Placeholder.addressPlaceHolder)
            BrandAddLogoImageView(title: Constant.Title.logoImage, subTitle: Constant.Title.option)
            BrandAddNoticeView()
            Spacer()
        }
    }
}


struct BrandAddView_Previews: PreviewProvider {
    static var previews: some View {
        BrandAddView()
    }
}
