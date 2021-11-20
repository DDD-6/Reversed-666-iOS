//
//  MainViewManager.swift
//  Bring
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Network

class MainViewManager {
    
    var brandService: BrandServiceComponent
    var productService: ProductServiceComponent
    
    init(
        brandService: BrandServiceComponent,
        productService: ProductServiceComponent
    ) {
        self.brandService = brandService
        self.productService = productService
    }
    
}
