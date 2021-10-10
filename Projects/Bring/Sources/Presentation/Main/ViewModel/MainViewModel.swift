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
    @Published var mainBrand: Brand?
    @Published var brandList: [Brand]?
    
    var mainRepository: MainRepositoryProtocol
    var cancellables: Set<AnyCancellable>
    
    /// # Params
    /// - isStub: 테스트용 MockData를 사용하려면 true, 실서버 이용하면 false
    /// - repository: 구현된 Repository외에 별도의 Repository(다른 네트워크를 이용하는 경우?)를 이용하는 경우를 위해 의존성 분리
    init(isStub: Bool = false, repository: MainRepositoryProtocol? = nil) {
        if let repository = repository {
            mainRepository = repository
        } else {
            mainRepository = MainRepository(isStub: isStub)
        }
        cancellables = Set<AnyCancellable>()
    }
    
    func fetchBrandData(name: String = "") {
        mainRepository
            .fetchBrand(name: name)
            .map { Brand.from(dtoModel: $0) }
            .sink { _ in }
                receiveValue: { [weak self] value in
                self?.mainBrand = value
            }
            .store(in: &cancellables)
    }
    
    func fetchBrandDataAll() {
        mainRepository
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
