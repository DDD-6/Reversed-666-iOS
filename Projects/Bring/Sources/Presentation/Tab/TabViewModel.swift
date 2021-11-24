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
        
        if BringUserDefaults.anonymousId.value() == nil {
            serviceManager.joinUser()
                .sink(receiveCompletion: { result in
                    switch result {
                        case let .failure(error):
                            print("error: \(error)")
                        case .finished:
                            print("Complete")
                    }
                }, receiveValue: { anonymousId in
                    BringUserDefaults.anonymousId.set(value: anonymousId)
                })
                .store(in: &cancellables)
        }
    }
}
