//
//  ProviderProtocol.swift
//  Repository
//
//  Created by devming on 2021/09/29.
//  Copyright © 2021 com.666. All rights reserved.
//

import Moya
import Combine
import Alamofire
import Foundation

// 각 provider 클래스에 채택할 protocol인데 아직 사용 안함. 21.09.29
public protocol ProviderProtocol: AnyObject {
    associatedtype T: TargetType
    
    var provider: MoyaProvider<T> { get }
    init(isStub: Bool,
         sampleStatusCode: Int,
         customEndpointClosure: ((T) -> Endpoint)?)
}

public extension ProviderProtocol {
    
    static func consProvider(
        _ isStub: Bool = false,
        _ sampleStatusCode: Int = 200,
        _ customEndpointClosure: ((T) -> Endpoint)? = nil) -> MoyaProvider<T> {
        
        if isStub == false {
            return MoyaProvider<T>(session: Session.default)
        } else {
            // 테스트 시에 호출되는 stub 클로져
            let endPointClosure = { (target: T) -> Endpoint in
                let sampleResponseClosure: () -> EndpointSampleResponse = {
                    EndpointSampleResponse.networkResponse(sampleStatusCode, target.sampleData)
                }
                
                return Endpoint(
                    url: URL(target: target).absoluteString,
                    sampleResponseClosure: sampleResponseClosure,
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers
                )
            }
            return MoyaProvider<T>(
                endpointClosure: customEndpointClosure ?? endPointClosure,
                stubClosure: MoyaProvider.immediatelyStub
            )
        }
    }
}

@available(iOS 13.0, *)
extension ProviderProtocol {
    
    func request<D: Decodable>(type: D.Type, atKeyPath keyPath: String? = nil, target: T) -> AnyPublisher<D, MoyaError> {
        return provider.requestPublisher(target)
            .map(type, atKeyPath: keyPath)
    }
}
