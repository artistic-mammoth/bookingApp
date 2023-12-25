//
//  TagCell.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct TagCell: View {
    // MARK: Public properties
    var label: String
    
    // MARK: - View body
    var body: some View {
        TextComponents.mainMedium(label)
            .foregroundColor(.secondaryGray)
            .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .fill(.secondaryBackground)
            )
    }
}

#Preview {
    TagCell(label: "asd")
}
