//
//  BookmarkFolder.swift
//  Bring
//
//  Created by devming on 2021/11/06.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Repository

struct BookmarkFolder: DomainModel, Hashable, Identifiable {
    typealias DTOType = BookmarkFolderDTO
    
    init() { }
    
    var id: Int = -1
    var folderName: String = ""
    var folderImageUrl: String = ""
    
    static func from(dtoModel: BookmarkFolderDTO) -> BookmarkFolder {
        var model = BookmarkFolder()
        model.id = dtoModel.id ?? -1
        model.folderName = dtoModel.name ?? ""
        model.folderImageUrl = dtoModel.thumbnailUrl ?? ""
        return model
    }
    
}
