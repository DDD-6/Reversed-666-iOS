//
//  BookmarkView.swift
//  Bring
//
//  Created by cado.avo on 2021/09/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

@frozen
enum EditState {
    case edit
    case normal
}

struct BookmarkView: View {
    
    @State private var state: BrandStateSegment = .product
    @State private var editState: EditState = .normal
    
    var body: some View {
        
        NavigationView {

            List {
                Picker("bring",
                       selection: $state) {
                    Text("상품")
                    Text("브랜드")
                }
                .pickerStyle(.segmented)
                
                
            }
            .navigationTitle("동길님의 블로그")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                Button {
                    print("huhu")
                } label: {
                    Text("hhu")
                }

            })
            
            
        }
        
        Picker("너의 이름은?",
               selection: $state) {
            Text("상품")
            Text("브랜드")
        }
               .pickerStyle(.segmented)
               .padding()
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
