//
//  TabViewModel.swift
//  Bring
//
//  Created by devming on 2021/11/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Network
import Combine

class TabViewModel {
    let serviceManager: UserServiceComponent
    var cancellables: Set<AnyCancellable>
    
    init(component: UserServiceComponent) {
        serviceManager = component
        cancellables = Set<AnyCancellable>()
        let id: String? = BringUserDefaults.anonymousId.value()
        if id == nil {
            serviceManager.joinUser()
                .sink(receiveCompletion: { result in
                    switch result {
                        case let .failure(error):
                            print("error: \(error.response?.statusCode)")
                        case .finished:
                            print("Complete")
                    }
                }, receiveValue: { anonymousId in
                    print("anonymousid: \(anonymousId)")
                    BringUserDefaults.anonymousId.set(value: anonymousId)
                })
                .store(in: &cancellables)
        } else {
            print("anonymousid: \(id)")
        }
    }
}
