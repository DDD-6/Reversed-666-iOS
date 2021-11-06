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
        static let brandName = "브랜드 네임"
        static let address = "주소"
        static let logoImage = "로고 이미지"
        static let option = "선택사항"
    }
    enum Placeholder {
        static let brandPlaceHolder = "화면에 표시될 이름을 적어주세요"
        static let addressPlaceHolder = "예: https://naver.com"
    }
}

struct BrandAddView: View {
    
    var body: some View {
        VStack {
            BrandAddTitleView()
            Text("haha")
            Spacer()
        }
    }
}

struct BrandAddTextFieldView: View {
    
    @State private var inputText: String = ""
    var title: String
    var placeholder: String
    
    var body: some View {
        VStack {
            Text(title)
            Spacer(minLength: 14)
            TextField(placeholder, text: $inputText)
                .onSubmit {
                    
                }
        }
    }
}

struct BrandAddView_Previews: PreviewProvider {
    static var previews: some View {
        BrandAddView()
    }
}
