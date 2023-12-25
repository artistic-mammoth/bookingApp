//
//  Int+ext.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import Foundation

extension Int {
    func withThousandsSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(for: self) ?? ""
    }
}
