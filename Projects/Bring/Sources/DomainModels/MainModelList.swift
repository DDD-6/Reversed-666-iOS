//
//  MainModelList.swift
//  Bring
//
//  Created by devming on 2021/11/22.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

enum MainListType {
    case bringBrand
    case popularBrand
    case mainBrand
}

struct MainModelList {
    var items: [MainListType: [Brand]]
}
