//
//  WebViewLikeBottomSheetViewModel.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Repository

class WebViewLikeBottomSheetViewModel: ObservableObject {
    @Published var folders: [BookmarkFolder]?
    // viewmodel에 연결되는건 repository보다는 service여야함.
//    var repository: MainRepositoryProtocol
//    var cancellables: Set<AnyCancellable>
//
//    init(repository: MainRepositoryProtocol? = nil, isStub: Bool = false) {
//        if let repository = repository {
//            self.repository = repository
//        }
//    }
}
