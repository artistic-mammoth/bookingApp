//
//  AdressButton.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct AdressButton: View {
    // MARK: - Public properties
    var action: () -> Void
    var label: String

    // MARK: - View body
    var body: some View {
        Button(action: action) {
            TextComponents.footer(label)
        }
        .foregroundStyle(.accentBlue)
        .disabled(true)
    }
}

#Preview {
    AdressButton(action: {}, label: "")
}
