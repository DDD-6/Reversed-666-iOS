//
//  WebViewModel.swift
//  Bring
//
//  Created by devming on 2021/10/30.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine

class WebViewModel: ObservableObject {
//    var goBack = PassthroughSubject<Void, Never>()
//    var goForward = PassthroughSubject<Void, Never>()
//    var refresh = PassthroughSubject<Void, Never>()
//    var like = PassthroughSubject<Void, Never>()
    
    @Published var originUrl: String
    @Published var canGoBack: Bool = false {
        didSet {
            print("Can Go Back didSet: \(canGoBack)")
        }
    }
    @Published var canGoForward: Bool = false {
        didSet {
            print("Can Go Forward didSet: \(canGoForward)")
        }
    }
    
    init(url: String) {
        originUrl = url
    }
}
