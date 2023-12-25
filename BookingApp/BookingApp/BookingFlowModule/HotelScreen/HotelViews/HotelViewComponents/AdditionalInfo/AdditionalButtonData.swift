//
//  AdditionalInfoData.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import Foundation

struct AdditionalInfo: Hashable {
    let header: String
    let secondaryText: String
    let iconName: String
    let action: () -> Void = {}
    
    static func == (lhs: AdditionalInfo, rhs: AdditionalInfo) -> Bool {
        lhs.header == rhs.header &&
        lhs.secondaryText == rhs.secondaryText &&
        lhs.iconName == rhs.iconName
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(header)
        hasher.combine(secondaryText)
        hasher.combine(iconName)
    }
}
