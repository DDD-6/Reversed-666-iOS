//
//  FloatingButton.swift
//  Bring
//
//  Created by cado.avo on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct FloatingButton<Content: View>: View {
    
    @Binding var showingSheet: Bool
    let content: Content
    
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
                        
                        content
                    }
            }
        }
    }
}
