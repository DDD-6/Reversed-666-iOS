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
    @Published var bringBrands: [BrandLiked]
    @Published var popularBrands: [Brand]
    @Published var mainBrands: [Brand]
    
    var serviceManager: BrandServiceComponent
    var cancellables: Set<AnyCancellable>
    
    init(serviceManager: BrandServiceComponent) {
        self.bringBrands = [BrandLiked]()
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
            .fetchLikeBrands()
            .map { $0.map { BrandLiked(from: $0) } }
//            .map { $0.map { Brand(from: $0) } }
            .sink(receiveCompletion: { result in
                switch result {
                    case let .failure(error):
                        print("\(#function) Error: \(error.response?.statusCode)")
                    case .finished:
                        break
                }
            }, receiveValue:  { [weak self] values in
                self?.bringBrands = values
            })
            .store(in: &cancellables)
    }
    
    func fetchPopularBrands() {
        serviceManager
            .fetchPopularBrands()
            .map { $0.map { Brand(from: $0) } }
            .sink(receiveCompletion: { result in
                switch result {
                    case let .failure(error):
                        print("\(#function) Error: \(error.response?.statusCode)")
                    case .finished:
                        break
                }
            }, receiveValue: { [weak self] values in
                self?.popularBrands = values
            })
            .store(in: &cancellables)
    }
    
    func fetchMainBrands() {
        serviceManager
            .fetchAllBrands()
            .map { $0.map { Brand(from: $0) } }
            .sink(receiveCompletion: { result in
                switch result {
                    case let .failure(error):
                        print("\(#function) Error: \(error.response?.statusCode)")
                    case .finished:
                        break
                }
            }, receiveValue: { [weak self] values in
                self?.mainBrands = values
            })
            .store(in: &cancellables)
    }
    
    func postLike(id: Int, completion: (() -> Void)? = nil) {
        serviceManager
            .postBrand(id: id)
            .sink { [weak self] result in
                switch result {
                    case let .failure(error):
                        print("\(#function) Error: \(error.response?.statusCode)")
                    case .finished:
                        self?.fetchBringBrands()
                }
            } receiveValue: { _ in
                // TODO: 원래 성공시에만 toggle되도록 해야됨
                completion?()
            }
            .store(in: &cancellables)

    }
}
