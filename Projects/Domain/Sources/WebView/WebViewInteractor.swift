//
//  WebViewInteractor.swift
//  Domain
//
//  Created by devming on 2021/12/15.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation
import Network
import Moya
import Combine
import CombineMoya

public class WebViewInteractor {
    
    private let serviceManager: FolderService
    
    public init(serviceManager: FolderServiceComponent) {
        self.serviceManager = FolderServiceManagerImpl()
    }
}
