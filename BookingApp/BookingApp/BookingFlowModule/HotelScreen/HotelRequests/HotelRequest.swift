//
//  HotelRequest.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import Foundation

struct HotelRequest: NetworkRequest {
    typealias DataModel = HotelResponse
    var component: EndpointComponent = BookingEndpoints.hotelPageInfo
    var qos: DispatchQoS.QoSClass = .userInitiated
}
