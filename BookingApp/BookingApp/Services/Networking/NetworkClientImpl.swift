//
//  NetworkClientImpl.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation
import Combine

final class NetworkClientImpl {
    // MARK: - Private properties
    private let session: URLSession
    
    // MARK: - Init
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

// MARK: - NetworkClientProtocol
extension NetworkClientImpl: NetworkClient {
    func sendRequest<T>(_ request: T) -> AnyPublisher<T.DataModel, NetworkingError> where T : NetworkRequest {
        guard let urlRequest = request.asURLRequest() else {
            return Fail(outputType: T.DataModel.self, failure: NetworkingError.badRequest).eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: request.qos))
            .tryMap({ [weak self] data, response in
                guard let self = self else {
                    throw NetworkingError.unknownError
                }
                
                guard let response = response as? HTTPURLResponse else {
                    throw NetworkingError.unknownError
                }
                
                // Test logging
                print("[\(response.statusCode)] '\(urlRequest.url!)'")
                
                if !(200...299).contains(response.statusCode) {
                    throw self.httpError(response.statusCode)
                }
                
                return data
            })
            .receive(on: DispatchQueue.main)
            .decode(type: T.DataModel.self, decoder: JSONDecoder())
            .mapError { [weak self] error in
                return self?.handleError(error) ?? .unknownError
            }
            .eraseToAnyPublisher()
    }
}

private extension NetworkClientImpl {
    func httpError(_ statusCode: Int) -> NetworkingError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }
    
    func handleError(_ error: Error) -> NetworkingError {
        switch error {
        case is Swift.DecodingError:
            return .decodingError(error.localizedDescription)
        case let urlError as URLError:
            return .urlSessionFailed(urlError)
        case let error as NetworkingError:
            return error
        default:
            return .unknownError
        }
    }
}
