//
//  AsyncCircularImageView.swift
//  Bring
//
//  Created by devming on 2021/11/25.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

struct AsyncCircularImageView: View {
    
    var imageUrl: String
    var size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size,
                               height: size)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
            }
        }
        .clipped()
        
    }
}


struct AsyncCircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncCircularImageView(imageUrl: "", size: .size13)
    }
}
