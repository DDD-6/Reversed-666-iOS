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
    
    typealias DTOType = BookmarkFolderDTO
    
    var id: Int = -1
    var folderName: String = ""
    var folderImageUrl: String = ""
    
    init() { }
    init(from dtoModel: BookmarkFolderDTO) {
        self.id = dtoModel.id ?? -1
        self.folderName = dtoModel.name ?? ""
        self.folderImageUrl = dtoModel.thumbnailUrl ?? ""
    }
}
