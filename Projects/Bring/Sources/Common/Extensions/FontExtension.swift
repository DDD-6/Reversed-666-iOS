//
//  FontExtension.swift
//  Bring
//
//  Created by devming on 2021/10/29.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI

/// Bring Font Style Guide: https://www.figma.com/file/mSuT8WBSaJtunjwXcOuSm1/UI?node-id=110%3A1005
enum BringFontStyle {
    /// [Popp - SemiBold 50] 브랜드 영문 large
    case brandL
    /// [Popp - SemiBold 18] 브랜드 영문 medium
    case brandM
    
    /// [Pret - Bold 24] 타이틀
    case heading0
    /// [Pret - Bold 18] 타이틀
    case heading1
    
    /// [Pret - Regular 16]
    case textXL
    /// [Pret - Regular 14]
    case textL
    /// [Pret - Regular 12]
    case textM
    /// [Pret - Regular 11]
    case textS
    /// [Pret - Regular 10]
    case textXS
    
    // 폰트 Style Guide 정의
    var font: Font {
        switch self {
        case .brandL:
            return Font.bringFont(.poppins, size: 50, weight: .black)
        case .brandM:
            return Font.bringFont(.poppins, size: 18, weight: .semibold)
        case .heading0:
            return Font.bringFont(.pretendard, size: 24, weight: .bold)
        case .heading1:
            return Font.bringFont(.pretendard, size: 18, weight: .bold)
        case .textXL:
            return Font.bringFont(.pretendard, size: 16, weight: .bold)
        case .textL:
            return Font.bringFont(.pretendard, size: 14, weight: .regular)
        case .textM:
            return Font.bringFont(.pretendard, size: 12, weight: .regular)
        case .textS:
            return Font.bringFont(.pretendard, size: 11, weight: .regular)
        case .textXS:
            return Font.bringFont(.pretendard, size: 10, weight: .regular)
        }
    }
}

enum FontFamily {
    case poppins
    case pretendard
}

extension Font.Weight {
    fileprivate func fontName(family: FontFamily) -> String {
        switch family {
        case .poppins:
            switch self {
            case .black:
                return "Poppins-Black"
            case .bold:
                return "Poppins-Bold"
            case .semibold:
                return "Poppins-SemiBold"
            case .regular:
                return "Poppins-Regular"
            case .light:
                return "Poppins-Light"
            default:
                return "Poppins-Regular"
            }
        case .pretendard:
            switch self {
            case .black:
                return "Pretendard-Black"
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            default:
                return "Pretendard-Regular"
            }
        }
    }
}

extension Font {
    // Style Guide 외의 폰트 규격을 사용해야하는 경우(가급적 스타일가이드의 폰트만 사용하도록 요청!!)
    static func bringFont(_ family: FontFamily, size: CGFloat, weight: Weight) -> Self {
        return Font.custom(weight.fontName(family: family), size: size)
    }
}
