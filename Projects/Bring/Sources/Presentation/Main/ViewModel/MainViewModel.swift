//
//  MainViewModel.swift
//  Bring
//
//  Created by devming on 2021/09/24.
//  Copyright © 2021 com.666. All rights reserved.
//

import SwiftUI
import Combine
import Moya
import CombineMoya
import Network

class MainViewModel: ObservableObject {
    @Published var mainBrand: Brand?
    @Published var brandList: [Brand]?
    
    var serviceManager: BrandServiceComponent
    var cancellables: Set<AnyCancellable>
    
    init(serviceManager: BrandServiceComponent) {
        self.serviceManager = serviceManager
        self.cancellables = Set<AnyCancellable>()
    }
    
    func fetchBrandData(name: String = "") {
        serviceManager
            .fetchBrand(name: name)
            .map { Brand.from(dtoModel: $0) }
            .sink { _ in }
                receiveValue: { [weak self] value in
                self?.mainBrand = value
            }
            .store(in: &cancellables)
    }
    
    func fetchBrandDataAll() {
        serviceManager
            .fetchAllBrands()
            .map { brandDtoList in
                brandDtoList.map {
                    Brand.from(dtoModel: $0)
                }
            }
            .sink { _ in }
                receiveValue: { [weak self] values in
                self?.brandList = values
            }
            .store(in: &cancellables)
    }
}
