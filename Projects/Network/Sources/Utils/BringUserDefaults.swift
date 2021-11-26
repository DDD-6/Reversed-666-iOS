//
//  BringUserDefaults.swift
//  Bring
//
//  Created by devming on 2021/11/23.
//  Copyright © 2021 com.666. All rights reserved.
//

import Foundation

public enum BringUserDefaults: String {
    case anonymousId
    
    public func set(value: Any?) {
        UserDefaults.standard.set(value, forKey: rawValue)
    }
    
    public func value<T>() -> T? {
        switch self {
            case .anonymousId:
                return UserDefaults.standard.string(forKey: rawValue) as? T
        }
         
    }
}
