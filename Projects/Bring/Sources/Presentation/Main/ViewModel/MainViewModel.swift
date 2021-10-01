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
    @Published var brand: BrandModel?
    
    var mainProvider: MainAPIProvider
    var cancellables: Set<AnyCancellable>
    
    init() {
        mainProvider = MainAPIProvider()
        cancellables = Set<AnyCancellable>()
    }
    
    func fetchBrandDatas(name: String = "") {
        mainProvider
            .fetchBrandDatas(name: name)
            .map { BrandModel.from(dtoModel: $0) }
            .sink { result in
                print("RESULT: \(result)")
            } receiveValue: { response in
                print("response: \(response)")
            }
            .store(in: &cancellables)
    }
    
    func mockBrandDatas(name: String = "") -> BrandModel? {
        return mainProvider
            .mockBrandDatas(name: name)
            .map { BrandModel.from(dtoModel: $0) }
    }
}
