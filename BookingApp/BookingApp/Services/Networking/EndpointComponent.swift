//
//  EndpointComponent.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

protocol EndpointComponent {
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}
