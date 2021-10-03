//
//  ProductFolderView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/02.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductFolderView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    enum Constant {
        static let spacing: CGFloat = 2.0
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            GeometryReader { geometry in
                HStack(spacing: Constant.spacing) {
                    modelData.brandData.image
                        .resizable()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                    
                    VStack(spacing: Constant.spacing) {
                        modelData.brandData.image
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        modelData.brandData.image
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                    }
                }
            }
            
            Spacer(minLength: 5)
            
            VStack(spacing: Constant.spacing) {
                Text("길동이 선물")
                    .font(.title3)
                Text("10개의 상품")
            }.padding([.leading, .bottom], 10)
            
        }
        .clipped()
        .background(.white)
        .cornerRadius(20)
        .shadow(color: .gray, radius: 5, x: 10, y: 10)
    }
    
    // 임시로 계산한 메인 사진 크기.. 서브 사진은 각각 2로 나눠줌
    func calculateMainPicture(_ value: CGFloat) -> CGFloat {
        return (value * 2) / 3
    }
}

struct ProductFolderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFolderView()
            .environmentObject(ModelData())
        
    }
}
