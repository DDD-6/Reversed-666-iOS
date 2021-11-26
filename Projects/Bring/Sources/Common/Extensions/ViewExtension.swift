//
//  ViewExtension.swift
//  Bring
//
//  Created by cado.avo on 2021/11/07.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
    
    func roundBorder(radiusSize: CGFloat, color: Color = Color("black00"), lineWidth: CGFloat = 1, isCornerRadius: Bool = true) -> some View {
        cornerRadius(isCornerRadius ? radiusSize : 0)
            .overlay(
                RoundedRectangle(
                    cornerRadius: radiusSize
                ).stroke(color, lineWidth: lineWidth)
            )
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY + width
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height - width
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}
