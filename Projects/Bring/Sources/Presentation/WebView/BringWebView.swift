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
    @State private var webView: WebView
    @State private var url: String
    @State private var canGoBack: Bool = false
    @State private var canGoForward: Bool = false
    @State private var presentedAsMoreActionSheet: Bool = false
    @State private var title: String = ""
    @State private var isLiked: Bool = false
    @State private var bottomSheetPosition: BottomSheetPosition = .hidden //1
    
    @Binding private var presentedAsModal: Bool
    
    
    private let toastView = BringToastView()
    
    init(url: String, title: String? = nil, presentedAsModal: Binding<Bool>) {
        self.url = url
        webView = WebView(url: url)
        if let title = title {
            self.title = title
        } else {
            self.title = url
        }
        self._presentedAsModal = presentedAsModal
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        presentedAsModal = false
                    } label: {
                        Image("Close")
                    }
                    Spacer()
                    Text(title)
                        .foregroundColor(Color("black00"))
                        .font(BringFontStyle.heading1.font)
                    Spacer()
                    Button {
                        presentedAsMoreActionSheet = true
                    } label: {
                        Image("icMoreHorizontal")
                    }
                    .actionSheet(isPresented: $presentedAsMoreActionSheet) {
                        ActionSheet(
                            title: Text("메뉴"), message: nil,
                            buttons: [
                                .default(Text("브라우저에서 열기"), action: {
                                    print("브라우저에서 열기")
                                    if let url = URL(string: url) {
                                        UIApplication.shared.open(url)
                                    }
                                }),
                                .default(Text("링크 복사"), action: {
                                    UIPasteboard.general.string = url
                                }),
                                .cancel(Text("취소")),
                            ]
                        )
                    }
                }
                .padding(.size3)
                
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
                        isLiked.toggle()
                        if isLiked {
                            toastView.showToast(message: "기본폴더에 브링 되었습니다.", rightBtn: "폴더 변경") {
                                bottomSheetPosition = bottomSheetPosition != .hidden ? .hidden : .middle
                            }
                        } 
                    } label: {
                        Image(isLiked ? "icHeartFill" : "icHeartLine")
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
            
            toastView
                .opacity(isLiked ? 1 : 0)
                .opacity(bottomSheetPosition == .hidden ? 1 : 0)
        }
        .bottomSheet(
            bottomSheetPosition: $bottomSheetPosition,
            options: [.notResizeable, .noDragIndicator]) {
                WebViewLikeBottomSheet(
                    bottomSheetPosition: $bottomSheetPosition
                )
            }
    }
}

struct BringWebView_Previews: PreviewProvider {
    static var previews: some View {
        let url = "https://www.naver.com"
        return BringWebView(url: url, presentedAsModal: .constant(true))
    }
}
