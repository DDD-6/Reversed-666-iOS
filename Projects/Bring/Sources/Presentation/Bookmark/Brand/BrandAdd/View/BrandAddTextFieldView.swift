//
//  BrandAddTextFieldView.swift
//  Bring
//
//  Created by cado.avo on 2021/10/31.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct BrandAddTextFieldView: View {
    
    @State private var inputText: String = ""
    var title: String
    var placeholder: String
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Text(title)
                Spacer()
            }
            TextField(placeholder, text: $inputText)
                .modifier(BrandAddTextFieldModifier())

        }.padding(EdgeInsets(top: 0, leading: 20, bottom: 18, trailing: 20))
    }
}

struct BrandAddTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 15, leading: 12, bottom: 15, trailing: 0))
            .disableAutocorrection(true)
            //.textFieldStyle(.roundedBorder)
            .border(.primary)
            .font(BringFontStyle.textL.font)
    }
}

struct CustomViewModifier: ViewModifier {
    var roundedCorners: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCorners)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(BringFontStyle.textL.font)
            
    }
}

struct RectangleTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}

struct BrandAddTextFieldView_Previews: PreviewProvider {
    
    static var previews: some View {
        BrandAddTextFieldView(title: "haha", placeholder: "huhu")
    }
}
