//
//  MainBrandTitleView.swift
//  Bring
//
//  Created by devming on 2021/10/21.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainBrandTitleView: View {
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("ADIDAS")
                        .font(.title)
                    Text("아디다스")
                        .font(.body)
                }
                Spacer()
            }
            VStack {
                HStack(alignment: .top) {
                    Button {
                        print("#")
                    } label: {
                        Image("icHeartLine")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .scaledToFit()
                            .clipped()
                    }
                    Button {
                        print("#")
                    } label: {
                        Image("icArrowRight")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .scaledToFit()
                            .clipped()
                    }
                }
                Spacer()
            }
        }
    }
}

struct MainBrandTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MainBrandTitleView()
            .frame(width: .infinity, height: .infinity, alignment: .center)
    }
}
