//
//  BookmarkFolder.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Network

struct BookmarkFolder: DomainModel, Hashable, Identifiable {
    
    typealias ResponseType = BookmarkFolderResponse
    
    var id: Int = -1
    var folderName: String = ""
    var folderImageUrl: [String]
    var numberOfProductCount: Int
    var description: String
    
    init(from response: BookmarkFolderResponse) {
        self.id = response.id ?? -1
        self.folderName = response.name ?? ""
        self.folderImageUrl = response.thumbnailUrl ?? [String]()
        self.numberOfProductCount = response.numberOfProductCount ?? 0
        self.description = response.description ?? ""
    }
}
