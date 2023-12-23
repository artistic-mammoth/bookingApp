//
//  BookingEndpoints.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation

enum BookingEndpoints {
    case hotelPageInfo
}

// https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473
extension BookingEndpoints: EndpointComponent {
    private var apiPath: String {
        "/v3"
    }
    
    var host: String {
        "run.mocky.io"
    }
    
    var path: String {
        switch self {
        case .hotelPageInfo:
            return apiPath + "/d144777c-a67f-4e35-867a-cacc3b827473"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .hotelPageInfo:
            return .get
        }
    }
}
