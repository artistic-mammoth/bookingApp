//
//  RaitingLabel.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import SwiftUI

struct RaitingLabel: View {
    // MARK: - Public properties
    var text: String
    
    // MARK: - View body
    var body: some View {
        HStack(spacing: 2) {
            Image("star-icon")
                .renderingMode(.template)
            TextComponents.mainMedium(text)
        }
        .foregroundStyle(.raitingYellow)
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(
            RoundedRectangle(cornerRadius: 5)
                .fill(.raitingYellowBackground)
        )
    }
}

#Preview {
    RaitingLabel(text: "5 превосходно")
}
