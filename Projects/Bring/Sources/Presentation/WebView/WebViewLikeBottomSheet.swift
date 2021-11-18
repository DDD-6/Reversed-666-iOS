//
//  WebViewLikeBottomSheet.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import BottomSheet

struct WebViewLikeBottomSheet: View {
    
    @ObservedObject
    var viewModel = WebViewLikeBottomSheetViewModel()
//    var bookmarkList: [ProductCategory]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("폴더 선택")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(.red)
                }
            }
            
        }
    }
}

struct WebViewLikeBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        return WebViewLikeBottomSheet()
    }
}

