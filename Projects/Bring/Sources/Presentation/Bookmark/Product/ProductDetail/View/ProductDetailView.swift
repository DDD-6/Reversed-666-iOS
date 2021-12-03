//
//  ProductDetailView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject private var model: ModelData
    
    @Environment(\.presentationMode) var presentationMode
    @State var offset: CGFloat = 0
    @State var startOffset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var titleBarHeight: CGFloat = 0
    
    var body: some View {
        
        let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 40), spacing: 0), count: 2)
        
        VStack {
            VStack {
                
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image("back")
                            .font(.title2)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("Scissor")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    Button(action: {}) {
                        Image("settings")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                }.padding()
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("길동이 선물")
                            .font(BringFontStyle.heading0.font)
                            
                        Text("길동이 선물 description")
                            .font(BringFontStyle.textM.font)
                            .foregroundColor(Color("gray06"))
                    }
                    .overlay(
                        GeometryReader { reader -> Color in
                            let width = reader.frame(in: .global).maxX
                            
                            DispatchQueue.main.async {
                                if titleOffset == 0 {
                                    titleOffset = width
                                }
                            }
                            
                            return Color.clear
                        }
                    )
                    
                    .padding()
                    .scaleEffect(getScale())
                    .offset(getOffset())
                    
                    Spacer()
                }
                
            }.background(.orange)
                .zIndex(1)
                .padding(.bottom, getOffset().height)
            BookmarkFilterView()
            
            if model.brandDatas.isEmpty {
                FolderDetailDefaultView()
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 0) {
//                        ForEach(model.brandDatas) { data in
                        ForEach(0..<model.brandDatas.count) { i in
                            ProductDetailCardView(tempIndex: i)
                        }
                    }.font(.largeTitle)
                }.overlay(GeometryReader{ proxy -> Color in
                        let minY = proxy.frame(in: .global).minY

                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                startOffset = minY
                            }
                            offset = startOffset - minY
                        }
                        return Color.clear
                    }
                )
            }
            
            
        }
        .navigationBarTitle("")
        .navigationTitle("우후후")
        
    }
    
    func getOffset() -> CGSize {
        var size: CGSize = .zero
        
        let screenWidth = UIScreen.main.bounds.width / 2
        
        size.width = offset > 0 ? (offset * 1.5 <= (screenWidth - titleOffset) ? offset * 1.5 : (screenWidth - titleOffset)) : 0
        size.height = offset > 0 ? (offset <= 75 ? -offset : -75) : 0
        
        return size
    }
    
    func getScale() -> CGFloat {
        
        if offset > 0 {
            let screenWi9dth = UIScreen.main.bounds.width
            let progress = 1 - (getOffset().width / screenWi9dth)
            
            return progress >= 0.9 ? progress : 0.9
        } else {
            return 1
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
