//
//  ProductFolderView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/02.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductFolderCardView: View {
    
    var folderData: BrandModel
    
    enum Constant {
        static let lineSpacing: CGFloat = 1.0
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
                        .frame(width: geometry.size.width / 336 * 196, height: geometry.size.height)
                    
                    VStack(spacing: Constant.lineSpacing) {
                        folderData.image
                            .resizable()
                            .frame(width: geometry.size.width / 336 * 140, height: geometry.size.height / 2)
                        folderData.image
                            .resizable()
                            .frame(width: geometry.size.width / 336 * 140, height: geometry.size.height / 2)
                    }
                }
            }
            .background(.black)
            
            Spacer(minLength: 1)
            
            HStack {
                
                VStack(alignment: .leading ,spacing: Constant.lineSpacing) {
                    HStack {
                        Text(folderData.title)
                            .font(.title3)
                            .padding([.leading], 8)
                            .padding([.top, .bottom], 6)
                        Spacer()
                    }.background(.white)
                    
                    HStack {
                        Text(folderData.subTitle)
                            .foregroundColor(Color("gray03"))
                            .padding([.leading], 8)
                            .padding([.top, .bottom], 6)
                        Spacer()
                    }.background(.white)
                }
                .background(.black)
                .border(.black, width: 1.0)
                
                Image("icArrowRightFill")
                    .frame(width: 36, height: 36, alignment: .center)
                    .padding()
                
            }.border(.black, width: 1)
            
        }
        .clipped()
        .background(.white)
        .border(.black, width: 1.0)
    }
    
    // 임시로 계산한 메인 사진 크기.. 서브 사진은 각각 2로 나눠줌
    func calculateMainPicture(_ value: CGFloat) -> CGFloat {
        return (value * 2) / 3
    }
}

struct ProductFolderCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductFolderCardView(folderData: ModelData().brandData)
    }
}
