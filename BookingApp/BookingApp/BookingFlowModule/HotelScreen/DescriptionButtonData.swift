//
//  AdditionalButtonData.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import Foundation

struct AdditionalButtonData: Hashable {
    let header: String
    let secondaryText: String
    let iconName: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(secondaryText)
        hasher.combine(iconName)
    }
}
