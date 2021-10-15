//
//  EmptyView.swift
//  Bring
//
//  Created by devming on 2021/10/14.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        return Text("This View is Empty.")
            .font(.title)
            .foregroundColor(.blue)
            .fontWeight(.bold)
    }
}


struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
