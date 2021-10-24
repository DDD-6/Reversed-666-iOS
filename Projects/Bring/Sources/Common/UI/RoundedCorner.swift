//
//  RoundedCorner.swift
//  Bring
//
//  Created by devming on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCorner_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorner()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        let roundedCorner = RoundedCorner(radius: radius,
                                          corners: corners)
        return clipShape(roundedCorner)
    }
}
