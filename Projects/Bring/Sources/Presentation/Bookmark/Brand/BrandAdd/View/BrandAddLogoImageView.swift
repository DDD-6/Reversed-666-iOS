//
//  BrandAddLogoImageView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/31.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandAddLogoImageView: View {
    
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack(spacing: 14) {
            HStack(spacing: 3) {
                Text(title)
                    .font(BringFontStyle.textL.font)
                Text(subTitle)
                    .font(BringFontStyle.textM.font)
                    .foregroundColor(Color("gray04"))
                Spacer()
            }
            HStack {
                Image("logo-plus")
                    .onTapGesture {
                        print("show image picker")
                    }
                Spacer()
            }
        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 18, trailing: 20))
    }
}

struct BrandAddLogoImageView_Previews: PreviewProvider {
    static var previews: some View {
        BrandAddLogoImageView(title: "haha", subTitle: "huhu")
    }
}
