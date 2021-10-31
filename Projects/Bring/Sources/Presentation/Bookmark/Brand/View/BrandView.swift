//
//  BrandView.swift
//  Bring
//
//  Created by apple on 2021/10/03.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandView: View {
    @EnvironmentObject private var model: ModelData
    @State private var searchString: String = ""
    @State private var showingSheet = false
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 40), spacing: 0), count: 3)
        
        ZStack {
            VStack {
                Text("searchable 추가")

                ScrollView{
                    LazyVGrid(columns: columns, spacing: 0) {
                        
                        ForEach(model.brandDatas) { data in
                            BrandCardView(brandData: data)
                                .aspectRatio(112/144,
                                             contentMode: .fill)
                        }
                        
                    }.font(.largeTitle)
                }
                
                
            }
            
            FloatingButton(showingSheet: $showingSheet)
        }
        
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
}

// button에
struct FloatingButton: View {
    
    @Binding var showingSheet: Bool
    // var content: some View 이렇게 해서 content도 받고 싶은데 잘 모르겟ㅠ
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.white)
                })
                    .background(Color("brandColor"))
                    .cornerRadius(300)
                    .padding()
                    .shadow(color: Color.black.opacity(0.25),
                            radius: 7,
                            x: 1,
                            y: 3)
                    .fullScreenCover(isPresented: $showingSheet) {
                        BrandAddView()
                        // content
                    }
            }
        }
    }
}

struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        BrandView()
            .environmentObject(ModelData())
    }
}

