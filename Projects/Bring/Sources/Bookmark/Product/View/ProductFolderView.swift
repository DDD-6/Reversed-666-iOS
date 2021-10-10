//
//  ProductFolderView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/02.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductFolderView: View {
    
    var folderData: BrandModel
    
    enum Constant {
        static let lineSpacing: CGFloat = 2.0
        static let radius: CGFloat = 20
        static let spacing: CGFloat = 5.0
        enum Title {
            static let padding: CGFloat = 10
        }
        enum Shadow {
            static let radius: CGFloat = 5
            static let size: CGFloat = 10
        }
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            GeometryReader { geometry in
                HStack(spacing: Constant.lineSpacing) {
                    folderData.image
                        .resizable()
                        .frame(width: geometry.size.width / 2, height: geometry.size.height)
                    
                    VStack(spacing: Constant.lineSpacing) {
                        folderData.image
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                        folderData.image
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 2)
                    }
                }
            }
            
            Spacer(minLength: Constant.spacing)
            
            VStack(alignment: .leading ,spacing: Constant.spacing) {
                Text(folderData.title)
                    .font(.title3)
                Text(folderData.subTitle)
            }.padding([.leading, .bottom], Constant.Title.padding)
            
        }
        .clipped()
        .background(.white)
        .cornerRadius(Constant.radius)
        .shadow(color: .gray, radius: Constant.Shadow.radius, x: Constant.Shadow.size, y: Constant.Shadow.size)
    }
    
    // 임시로 계산한 메인 사진 크기.. 서브 사진은 각각 2로 나눠줌
    func calculateMainPicture(_ value: CGFloat) -> CGFloat {
        return (value * 2) / 3
    }
}

struct ProductFolderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFolderView(folderData: ModelData().brandData)
    }
}
