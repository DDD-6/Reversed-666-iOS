//
//  BringSearchBar.swift
//  Bring
//
//  Created by cado.avo on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Combine

struct BringSearchBar: View {
    
    enum Constant {
        static let searchPlaceHolder = "저장한 브랜드를 검색하세요"
    }
    
    //@StateObject private var textObserver = TextFieldObserver()
    @Binding var searchingText: String
    
    var body: some View {
        
        TextField(Constant.searchPlaceHolder, text: $searchingText)
            .padding()
            .border(.black, width: 1)
            .overlay(
                HStack {
                    Spacer()
                    
                    Button {
                        print("testing")
                    } label: {
                        Image("search_orange")
                    }
                    .padding()
                    .border(width: 1, edges: [ .leading], color: .black)
                    // 이거 path 맞추는게 좀 어렵네요ㅠ
                }
            )
            .onChange(of: searchingText) {
                print($0)
            }
//            .onReceive(textObserver.$debouncedText, perform: { value in
//                searchingText = value
//            })
            .frame(height: 40, alignment: .center)
    }
}

class TextFieldObserver : ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    var action: (String) -> Void
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(action: @escaping (String) -> Void) {
        
        self.action = action
        
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] text in
                self?.debouncedText = text
            })
            .store(in: &subscriptions)
        
        $debouncedText
            .sink { [weak self] text in
                self?.action(text)
            }
            .store(in: &subscriptions)
    }
}
