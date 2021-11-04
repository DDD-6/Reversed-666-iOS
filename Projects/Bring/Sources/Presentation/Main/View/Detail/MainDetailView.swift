//
//  MainDetailView.swift
//  Bring
//
//  Created by devming on 2021/11/04.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct MainDetailView: View {
    
    var url: String
    
    enum Tab {
        case main
        case bookmark
        case my
    }
    
    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        VStack {
            BringWebView(url: url)
//            HStack {
//
//                Button(action: {
//                    self.viewModel.foo.send(true)
//                }) {
//                    Text("보내기")
//                }
//            }
        }
//        .onReceive(self.viewModel.bar.receive(on: RunLoop.main)) { value in
////            self.bar = value
//        }
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MainDetailView(url: "https://www.naver.com")
    }
}
