//
//  MoreDetailsButton.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct MoreDetailsButton: View {
    // MARK: - Public properties
    var action: () -> Void
    
    // MARK: - View body
    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                TextComponents.mainMedium("Подробнее о номере")
                Image("chevron-right")
                    .renderingMode(.template)
            }
            .foregroundStyle(.accentBlue)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 2))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.backgroundBlue)
            )
        }
        .disabled(true)
        
    }
}

#Preview {
    MoreDetailsButton(action: {})
}
