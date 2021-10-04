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
import Repository

class MainViewModel: ObservableObject {
    @Published var mainBrand: BrandModel?
    @Published var brandList: [BrandModel]?
    
    var mainProvider: MainAPIProvider
    var cancellables: Set<AnyCancellable>
    
    init(isStub: Bool = false) {
        mainProvider = MainAPIProvider(isStub: isStub)
        cancellables = Set<AnyCancellable>()
    }
    
    func fetchBrandData(name: String = "") {
        mainProvider
            .fetchBrand(name: name)
            .map { BrandModel.from(dtoModel: $0) }
            .sink { _ in }
                receiveValue: { [weak self] value in
                self?.mainBrand = value
            }
            .store(in: &cancellables)
    }
    
    func fetchBrandDataAll(isMocked: Bool = false) {
        mainProvider
            .fetchAllBrands()
            .map { brandDtoList in
                brandDtoList.map {
                    BrandModel.from(dtoModel: $0)
                }
            }
            .sink { _ in }
                receiveValue: { [weak self] values in
                self?.brandList = values
            }
            .store(in: &cancellables)
    }
}
