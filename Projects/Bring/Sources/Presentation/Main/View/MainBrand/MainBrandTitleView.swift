//
//  MainBrandTitleView.swift
//  Bring
//
//  Created by devming on 2021/10/21.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainBrandTitleView: View {
    @State var isLiked: Bool
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
//                    print("font: \()")
                    Text("ADIDAS")
                        .font(BringFontStyle.brandL.font)
                    Text("아붂부스")
                        .font(BringFontStyle.textL.font)
                }
                Spacer()
            }
            VStack {
                HStack(alignment: .top) {
                    Button {
                        print("~")
                    } label: {
                        Image(isLiked ? "icHeartFill" : "icHeartLine")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .scaledToFit()
                            .clipped()
                            .padding(10)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 30, height: 30, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.blue))
                            .padding(11)
                        Image("icArrowRightFill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .scaledToFit()
                            .padding(10)
                            .background(.white)
                    }
                }
                Spacer()
            }
        }
    }
}

struct MainBrandTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainBrandTitleView(isLiked: true)
            .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}
