//
//  NetworkClient.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation
import Combine

protocol NetworkClient {
    func sendRequest<T: NetworkRequest>(_ request: T) -> AnyPublisher<T.DataModel, NetworkingError>
}
