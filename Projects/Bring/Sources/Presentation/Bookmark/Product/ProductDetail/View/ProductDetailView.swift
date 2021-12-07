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
                    
                    Text("길동이 선물")
                        .font(BringFontStyle.heading0.font)
                        .overlay(
                            GeometryReader { reader -> Color in
                                let width = reader.frame(in: .global).maxX
                                
                                DispatchQueue.main.async {
                                    if titleOffset == 0 {
                                        print("아휴: \(width)")
                                        titleOffset = -width
                                    }
                                }
                                
                                return Color.clear
                            }.frame(width: 0, height: 0 )
                        )
                        .padding()
                        .scaleEffect(getScale())
                        .offset(getOffset())
                    
                    Spacer()
                }
                
                HStack {
                    Text("길동이 선물 description")
                        .font(BringFontStyle.textM.font)
                        .foregroundColor(Color("gray06"))
                    Spacer()
                }
                .padding()
                .padding(.top, -16)
                .offset(y: offset > 0 ? (offset <= 95 ? -offset : -95) : -15)
            }
            .zIndex(1)
            .padding(.bottom, getOffset().height)
            .background(
                offset >= 20 ? Color.orange : Color.white
            )
            .overlay(
                GeometryReader { reader -> Color in
                    
                    let height = reader.frame(in: .global).minY
                    
                    DispatchQueue.main.async {
                        titleBarHeight = height - ( UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                    }
                    return Color.clear
                }
            )
            
            if model.brandDatas.isEmpty {
                FolderDetailDefaultView()
            } else {
                ScrollView {
                    BookmarkFilterView()
                    LazyVGrid(columns: columns, spacing: 0) {
                        //                        ForEach(model.brandDatas) { data in
                        ForEach(0..<11 /*model.brandDatas.count*/) { i in
                            ProductDetailCardView(tempIndex: i)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.top, titleBarHeight)
                    .overlay(GeometryReader{ proxy -> Color in
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            if startOffset == 0 {
                                startOffset = minY
                            }
                            offset = -(minY + startOffset - 44) > 0 ? -(minY + startOffset - 44) : 0
                            //print("offset: \(offset), startOffset: \(startOffset), minY: \(minY)")
                        }
                        return Color.clear
                    }.frame(width: 0, height: 0) ,alignment: .top
                    )
                }
                
            }
            
            
        }
        .navigationBarTitle("")
        .navigationTitle("우후후")
        
    }
    
    func getOffset() -> CGSize {
        var size: CGSize = .zero
        
        let screenWidth = UIScreen.main.bounds.width / 2
        
        //print("screenWidth: \(screenWidth), titleOffset: \(titleOffset), offset: \(offset)")
        
        size.width = offset > 0 ? (offset * 1.5 <= (screenWidth - titleOffset/2) ? offset * 1.5 : (screenWidth - titleOffset/2)) : 0
        size.height = offset > 0 ? (offset <= 75 ? -offset : -75) : 0
        
        return size
    }
    
    func getScale() -> CGFloat {
        
        if offset > 0 {
            let screenWidth = UIScreen.main.bounds.width
            let progress = 1 - (getOffset().width / screenWidth)
            print("progress: \(progress)")
            return progress >= 0.8 ? progress : 0.8
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
