//
//  BringShapeView.swift
//  Bring
//
//  Created by devming on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BringShapeView: View {
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width,
                       height: height,
                       alignment: .center)
                .foregroundColor(.black)
                .cornerRadius(width / 2,
                              corners: [.topLeft,
                                        .topRight])
            
            Rectangle()
                .frame(width: width - CGFloat.size1 / 2,
                       height: height - CGFloat.size1 / 2,
                       alignment: .center)
                .foregroundColor(.white)
                .cornerRadius((width - CGFloat.size1 / 2) / 2,
                              corners: [.topLeft,
                                        .topRight])
        }
    }
}

struct BringShapeView_Previews: PreviewProvider {
    static var previews: some View {
        BringShapeView(width: 336, height: 428)
    }
}
