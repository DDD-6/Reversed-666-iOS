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
    @Published var bringBrands: [Brand]
    @Published var popularBrands: [Brand]
    @Published var mainBrands: [Brand]
    
    var serviceManager: BrandServiceComponent
    var cancellables: Set<AnyCancellable>
    
    init(serviceManager: BrandServiceComponent) {
        self.bringBrands = [Brand]()
        self.mainBrands = [Brand]()
        self.popularBrands = [Brand]()
        
        self.serviceManager = serviceManager
        self.cancellables = Set<AnyCancellable>()
    }
    
    func fetchBrandData(name: String = "") {
//        serviceManager
//            .fetchBrand(name: name)
//            .map { Brand(from: $0) }
//            .sink { [weak self] value in
//                self?.bringedBrands = value
//            }
//            .store(in: &cancellables)
    }
    
    func fetchBringBrands() {
        serviceManager
            .fetchBookmarkBrands()
            .map { $0.map { Brand(from: $0) } }
            .sink { [weak self] values in
                self?.bringBrands = values
            }
            .store(in: &cancellables)
    }
    
    func fetchPopularBrands() {
        serviceManager
            .fetchPopularBrands()
            .map { $0.map { Brand(from: $0) } }
            .sink { [weak self] values in
                self?.popularBrands = values
            }
            .store(in: &cancellables)
    }
    
    func fetchMainBrands() {
        serviceManager
            .fetchAllBrands()
            .map { $0.map { Brand(from: $0) } }
            .sink { [weak self] values in
                self?.mainBrands = values
            }
            .store(in: &cancellables)
    }
}
