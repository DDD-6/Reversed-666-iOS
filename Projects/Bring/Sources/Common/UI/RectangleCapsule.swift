//
//  RectangleCapsule.swift
//  Bring
//
//  Created by cado.avo on 2021/10/17.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct RectangleCapsule: View {
    
    var text: String = "Title"
    var body: some View {
        Rectangle()
            .border(.black, width: 1.0)
            .foregroundColor(Color("brandColor").opacity(0.0))
            .overlay(
                Text(text)
            )
    }
}

struct RectangleCapsule_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCapsule()
    }
}
