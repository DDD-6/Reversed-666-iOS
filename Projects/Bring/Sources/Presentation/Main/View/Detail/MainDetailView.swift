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
    var presentedAsModal: Binding<Bool>
    
    enum Tab {
        case main
        case bookmark
        case my
    }
    
    init(url: String, presentedAsModal: Binding<Bool>) {
        self.url = url
        self.presentedAsModal = presentedAsModal
    }
    
    var body: some View {
        VStack {
            BringWebView(url: url, presentedAsModal: presentedAsModal)
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
        MainDetailView(url: "https://www.naver.com", presentedAsModal: .constant(true))
    }
}
