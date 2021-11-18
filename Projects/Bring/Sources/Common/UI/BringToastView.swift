//
//  BringToastView.swift
//  Bring
//
//  Created by devming on 2021/10/29.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Combine

struct BringToastView: View {
    @State private(set) var isVisible: Bool = false {
        didSet {
            if isVisible {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        self.isVisible = false
                        isVisibleSubject.send(false)
                    }
                }
            }
        }
    }
    private var isVisibleSubject = PassthroughSubject<Bool, Never>()
    private var messageValue = CurrentValueSubject<String, Never>("")
    private var buttonTitle = CurrentValueSubject<String?, Never>(nil)
    private var buttonAction = CurrentValueSubject<(() -> Void)?, Never>(nil)
    
    var body: some View {
        return VStack {
            Spacer()
            HStack {
                Text(messageValue.value)
                    .font(BringFontStyle.textL.font)
                    .frame(alignment: .leading)
                    .foregroundColor(Color("gray00"))
                Spacer()
                if let buttonTitle = buttonTitle.value,
                   let action = buttonAction.value {
                        Button(action: action) {
                            Text(buttonTitle)
                                .font(BringFontStyle.textM.font)
                                .frame(alignment: .trailing)
                                .foregroundColor(Color("gray00"))
                                .padding(EdgeInsets(top: .size2, leading: .size4, bottom: .size2, trailing: .size4))
                        }
                        .border(Color("gray00"), width: 1)
                }
            }
            .padding()
            .background(Color("gray80"))
            .cornerRadius(2)
            .onReceive(isVisibleSubject.receive(on: RunLoop.main)) { isVisible in
                self.isVisible = isVisible
            }
        }
        .padding()
        .opacity(isVisible ? 1 : 0)
    }
    
    /// 토스트 발생시킬 곳에서 호출하는 메소드
    func showToast(message: String, rightBtn btnTitle: String? = nil, action: (() -> Void)? = nil) {
        if isVisible { return }
        if message.isEmpty && btnTitle == nil { return }
        
        messageValue.send(message)
        buttonTitle.send(btnTitle)
        buttonAction.send(action)
        
        withAnimation(.easeInOut(duration: 0.15)) {
            isVisibleSubject.send(true)
            isVisible = true
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        BringToastView()
        .previewLayout(.fixed(width: 350, height: 50))
    }
}
