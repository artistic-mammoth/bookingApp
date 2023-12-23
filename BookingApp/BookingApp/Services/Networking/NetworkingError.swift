//
//  NetworkingError.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation

enum NetworkingError: LocalizedError, Equatable {
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case error4xx(_ code: Int)
    case serverError
    case error5xx(_ code: Int)
    case decodingError( _ description: String)
    case urlSessionFailed(_ error: URLError)
    case unknownError
}
