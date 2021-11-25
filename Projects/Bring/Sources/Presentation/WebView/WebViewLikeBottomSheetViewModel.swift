//
//  WebViewLikeBottomSheetViewModel.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Combine
import Network
import Moya

class WebViewLikeBottomSheetViewModel: ObservableObject {
    @Published var folders: [BookmarkFolder]
    
    let serviceManager: FolderServiceComponent
    var cancellables: Set<AnyCancellable>
    
    init(serviceManager: FolderServiceComponent) {
        self.folders = [BookmarkFolder]()
        self.serviceManager = serviceManager
        self.cancellables = Set<AnyCancellable>()
        
        fetchFoldersAll()
    }
    
    func fetchFoldersAll() {
        serviceManager.fetchFoldersAll()
            .map { $0.map { BookmarkFolder(from: $0) } }
            .sink(receiveCompletion: { result in
                switch result {
                    case let .failure(error):
                        print("error: \(error)")
                    case .finished:
                        print("Complete")
                }
            }, receiveValue: { [weak self] folders in
                self?.folders = folders
            })
            .store(in: &cancellables)
    }
    
    func createFolder(name: String, description: String) {
        serviceManager
            .createFolder(
                name: name,
                description: description
            )
            .map { BookmarkFolder(from: $0) }
            .sink(receiveCompletion: { result in
                switch result {
                    case let .failure(error):
                        print("error: \(error)")
                    case .finished:
                        print("Complete")
                }
            }, receiveValue: { [weak self] newFolder in
                self?.folders.append(newFolder)
            })
            .store(in: &cancellables)
    }
}
