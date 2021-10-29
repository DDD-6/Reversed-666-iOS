//
//  ToastView.swift
//  Bring
//
//  Created by devming on 2021/10/29.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

// TODO: 사용법이 너무 불안전해서 더 좋은 방법을 찾아내도록 해야함 ㅠㅠ
struct ToastView: View {
    @Binding var isShownToast: Bool {
        didSet {
            if isShownToast {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation(.easeInOut(duration: 0.15)) {
                        isShownToast = false
                    }
                }
            }
        }
    }
    
    var message: String
    var buttonTitle: String? = nil
    var action: (() -> Void)? = nil
    
    var body: some View {
        return VStack {
            Spacer()
            
            HStack {
                Text(message)
                    .font(BringFontStyle.textL.font)
                    .frame(alignment: .leading)
                    .foregroundColor(Color("gray00"))
                Spacer()
                if let buttonTitle = buttonTitle,
                   let action = action {
                    Button(action: action) {
                        VStack {
                            Spacer()
                            Text(buttonTitle)
                                .font(BringFontStyle.textM.font)
                                .frame(alignment: .leading)
                                .foregroundColor(Color("gray00"))
                                .padding(EdgeInsets(top: 0, leading: .size4, bottom: 0, trailing: .size4))
                            Spacer()
                        }
                    }
                    .border(Color("gray00"), width: 1)
                }
            }
            .padding()
            .background(Color("gray80"))
            .cornerRadius(2)
        }
        .padding()
        .opacity(isShownToast ? 1 : 0)
    }
    
    func showToast() {
        if isShownToast { return }
        withAnimation(.easeInOut(duration: 0.15)) {
            isShownToast = true
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(isShownToast: .constant(false), message: "Hello", buttonTitle: "버튼") {
            print("@@")
        }
        .previewLayout(.fixed(width: 350, height: 50))
    }
}

// 토스트를 사용하고자 하는 View에서 토스트가 사용된다는걸 명시적으로 표기하기 위한 최소한의 장치
// - 아래의 Bool값을 @State로 선언해야한다.
protocol Toastable {
    var isShownToast: Bool { get set }
}
