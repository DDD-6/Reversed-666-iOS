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
import Domain

class MainViewModel: ObservableObject {
    @Published var bringBrands: [BrandLiked]
    @Published var popularBrands: [Brand]
    @Published var mainBrands: [Brand]
    
    var interactor: MainInteractor
    var cancellables: Set<AnyCancellable>
    
    init(interactor: MainInteractor) {
        self.bringBrands = [BrandLiked]()
        self.mainBrands = [Brand]()
        self.popularBrands = [Brand]()
        
        self.interactor = interactor
        self.cancellables = Set<AnyCancellable>()
    }
    
    func fetchBringBrands() {
        interactor
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
        interactor
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
        interactor
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
        interactor
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
