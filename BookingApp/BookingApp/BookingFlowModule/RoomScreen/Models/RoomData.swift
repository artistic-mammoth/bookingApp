//
//  RoomData.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import Foundation

struct RoomData: Hashable {
    let name: String
    let price: String
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
    
    static func == (lhs: RoomData, rhs: RoomData) -> Bool {
        lhs.name == rhs.name &&
        lhs.price == rhs.price &&
        lhs.pricePer == rhs.pricePer &&
        lhs.peculiarities == rhs.peculiarities &&
        lhs.imageUrls == rhs.imageUrls
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(price)
        hasher.combine(peculiarities)
        hasher.combine(imageUrls)
    }
}
