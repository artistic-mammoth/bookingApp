//
//  RoomRequest.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import Foundation

struct RoomRequest: NetworkRequest {
    typealias DataModel = RoomResponse
    var component: EndpointComponent = BookingEndpoints.roomPageInfo
    var qos: DispatchQoS.QoSClass = .userInitiated
}
