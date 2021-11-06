//
//  BrandAddTitleView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandAddTitleView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Text("브랜드 추가")
                .font(BringFontStyle.heading1.font)
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("Close")
                }
                Spacer()
                Button {
                    print("추가 버튼 클릭")
                } label: {
                    Text("추가")
                        .font(BringFontStyle.textL.font)
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 3, leading: 13, bottom: 4, trailing: 12))
                        .background(Color("gray30"))
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                }
            }
            
        }.padding()
    }
}

struct BrandAddTitleView_Previews: PreviewProvider {
    static var previews: some View {
        BrandAddTitleView()
    }
}
