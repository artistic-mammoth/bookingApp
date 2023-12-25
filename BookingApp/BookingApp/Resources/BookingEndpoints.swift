//
//  BookingEndpoints.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation

enum BookingEndpoints {
    case hotelPageInfo
    case roomPageInfo
}

// https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473
// https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195
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
        case .roomPageInfo:
            return apiPath + "/8b532701-709e-4194-a41c-1a903af00195"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .hotelPageInfo:
            return .get
        case .roomPageInfo:
            return .get
        }
    }
}
