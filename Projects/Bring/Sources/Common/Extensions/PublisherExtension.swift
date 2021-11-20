//
//  PublisherExtension.swift
//  Bring
//
//  Created by devming on 2021/11/20.
//  Copyright © 2021 com.666. All rights reserved.
//

import Combine

extension Publisher {
    func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable {
        return sink(receiveCompletion: { _ in }, receiveValue: receiveValue)
    }
}
