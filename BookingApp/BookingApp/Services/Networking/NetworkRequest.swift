//
//  NetworkRequest.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation

protocol NetworkRequest where DataModel: Codable {
    associatedtype DataModel
    var component: EndpointComponent { get }
    var qos: DispatchQoS.QoSClass { get }
}

extension NetworkRequest {
    func asURLRequest() -> URLRequest? {
        guard let url = getFullURL() else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.component.method.rawValue
        urlRequest.timeoutInterval = 10

        return urlRequest
    }
    
    private func getFullURL() -> URL? {
        var urlComponents: URLComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = self.component.host
        urlComponents.path = self.component.path
        return urlComponents.url
    }
}
