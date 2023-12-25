//
//  ActiveButton.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct ActiveButton: View {
    // MARK: - Public properties
    var action: () -> Void
    var label: String
    
    // MARK: - View body
    var body: some View {
        HStack {
            Button(action: action) {
                TextComponents.mainMedium(label)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.accentBlue)
                    )
            }
        }
    }
}

#Preview {
    ActiveButton(action: {}, label: "К выбору номера")
}
