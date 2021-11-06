//
//  WebView.swift
//  Bring
//
//  Created by devming on 2021/10/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import UIKit
import Combine
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    private var webView: WKWebView
    @ObservedObject private var viewModel: WebViewModel
    
    init(url: String) {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false  // JavaScript가 사용자 상호 작용없이 창을 열 수 있는지 여부
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView = WKWebView(frame: .zero, configuration: configuration)
        
        viewModel = WebViewModel(url: url)
    }
    
    // 변경 사항을 전달하는 데 사용하는 사용자 지정 인스턴스를 만듭니다.
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // 뷰 객체를 생성하고 초기 상태를 구성합니다. 딱 한 번만 호출됩니다.
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false  // JavaScript가 사용자 상호 작용없이 창을 열 수 있는지 여부
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
//        webView = WKWebView(frame: CGRect.zero, configuration: configuration)
        webView.navigationDelegate = context.coordinator    // webview의 탐색 동작을 관리하는 데 사용하는 개체
        webView.allowsBackForwardNavigationGestures = true    // 가로로 스와이프 동작이 페이지 탐색을 앞뒤로 트리거 하는지 여부
        webView.scrollView.isScrollEnabled = true    // webview와 관련된 스크롤보기에서 스크롤 가능 여부
        
        if let url = URL(string: originUrl) {
            webView.load(URLRequest(url: url))    // 지정된 URL 요청 개체에서 참조하는 웹 콘텐츠를 로드하고 탐색
        }
        
        return webView
    }
    
    // 지정된 뷰의 상태를 다음의 새 정보로 업데이트합니다.
    func updateUIView(_ webView: WKWebView, context: Context) { }
    
//    var canGoBack: Bool {
    var canGoBack: AnyPublisher<Bool, Never> {
        return viewModel.$canGoBack.eraseToAnyPublisher()
    }
    
//    var canGoForward: Bool {
    var canGoForward: AnyPublisher<Bool, Never> {
        return viewModel.$canGoForward.eraseToAnyPublisher()
    }
    
    func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func reload() {
        webView.reload()
    }
    
    var currentUrl: String? {
        return webView.url?.absoluteString
    }
    
    var originUrl: String {
        return viewModel.originUrl
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        // 생성자
        init(_ uiWebView: WebView) {
            self.parent = uiWebView
        }

        // 지정된 기본 설정 및 작업 정보를 기반으로 새 콘텐츠를 탐색 할 수있는 권한을 대리인에게 요청
        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            

            return decisionHandler(.allow)
        }

        // 기본 프레임에서 탐색이 시작되었음
        func webView(_ webView: WKWebView,
                     didStartProvisionalNavigation navigation: WKNavigation!) {
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }
//
//        // 웹보기가 기본 프레임에 대한 내용을 수신하기 시작했음
//        func webView(_ webView: WKWebView,
//                     didCommit navigation: WKNavigation!) {
//            print("내용을 수신하기 시작");
//        }
//
        // 탐색이 완료 되었음
        func webView(_ webView: WKWebView,
                     didFinish: WKNavigation!) {
            print("탐색이 완료")
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }
//
        // 초기 탐색 프로세스 중에 오류가 발생했음 - Error Handler
        func webView(_ webView: WKWebView,
                     didFailProvisionalNavigation: WKNavigation!,
                     withError: Error) {
            print("초기 탐색 프로세스 중에 오류가 발생했음")
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }

        // 탐색 중에 오류가 발생했음 - Error Handler
        func webView(_ webView: WKWebView,
                     didFail navigation: WKNavigation!,
                     withError error: Error) {
            print("탐색 중에 오류가 발생했음")
            parent.viewModel.canGoBack = webView.canGoBack
            parent.viewModel.canGoForward = webView.canGoForward
        }
    }

}
