//
//  BringWebView.swift
//  Bring
//
//  Created by devming on 2021/11/04.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import WebKit
import BottomSheet

struct BringWebView: View {
    enum WebViewLikeBottomSheetPosition: CGFloat, CaseIterable {
        case position = 0.4, hidden = 0
    }
    
    @State var bottomSheetPosition: BottomSheetPosition = .hidden //1
    
    @State var url: String
    @State private var webView: WebView
    @State private var canGoBack: Bool = false
    @State private var canGoForward: Bool = false
    
    init(url: String) {
        self.url = url
        webView = WebView(url: url)
    }
    
    var body: some View {
        ZStack {
            VStack {
                webView
                    .border(.gray, width: 0.3)
                
                HStack {
                    Button {
                        webView.goBack()
                    } label: {
                        Image("icArrowLeft")
                    }
                    .opacity(canGoBack ? 1 : 0.3)
                    .disabled(!canGoBack)
                    .onReceive(webView.canGoBack) { canGoBack in
                        self.canGoBack = canGoBack
                    }
                    Spacer()
                    Button {
                        webView.goForward()
                    } label: {
                        Image("icArrowRight")
                    }
                    .opacity(canGoForward ? 1 : 0.3)
                    .disabled(!canGoForward)
                    .onReceive(webView.canGoForward) { canGoForward in
                        self.canGoForward = canGoForward
                    }
                    Spacer()
                    Button {
                        bottomSheetPosition = bottomSheetPosition != .hidden ? .hidden : .middle
                    } label: {
                        Image("icHeartLine")
                    }
                    Spacer()
                    Button {
                        webView.reload()
                    } label: {
                        Image("icRefresh")
                    }
                }
                .padding(EdgeInsets(top: .size2,
                                    leading: .size8,
                                    bottom: .size2,
                                    trailing: .size8))
            }
            
            Rectangle()
                .overlay(.black)
                .opacity(bottomSheetPosition == .hidden ? 0 : 0.5)
        }
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition,
                     options: [.tapToDissmiss, .appleScrollBehavior, .noDragIndicator, .notResizeable, .showCloseButton(action: {
            
        })]) {
            WebViewLikeBottomSheet()
        }
    }
}

struct BringWebView_Previews: PreviewProvider {
    static var previews: some View {
        let url = "https://www.naver.com"
        return BringWebView(url: url)
    }
}
