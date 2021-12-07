//
//  LottieView.swift
//  Bring
//
//  Created by cado.avo on 2021/12/04.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import UIKit
import Lottie

struct LottieView: UIViewRepresentable {

    typealias UIViewType = UIView
    
    var name: String = "bring_splash"
    @Binding var show: Bool
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {

        let animationView = AnimationView()
        animationView.animation = Animation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        
        animationView.play { status in
            if status {
                // toggling view...
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)){
                    show.toggle()
                }
            }
        }
        
        return animationView
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {

    }
}

