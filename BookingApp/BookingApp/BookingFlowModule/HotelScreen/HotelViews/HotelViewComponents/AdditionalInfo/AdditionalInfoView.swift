//
//  AdditionalInfoView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct AdditionalInfoView: View {
    // MARK: - Public properties
    var additionalData: [AdditionalInfo]
    
    // MARK: - View body
    var body: some View {
        VStack {
            ForEach(additionalData.indices, id: \.self) { index in
                let button = additionalData[index]
                if index >= 1 {
                    Divider()
                        .padding(.leading, 24 + 9)
                        .padding([.top, .bottom], 5)
                }
                Button(action: button.action) {
                    HStack(spacing: 12) {
                        Image(button.iconName)
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(Color.black)
                        VStack(alignment: .leading, spacing: 2) {
                            TextComponents.mainMedium(button.header)
                                .foregroundStyle(.accentBlack)
                            TextComponents.footer(button.secondaryText)
                                .foregroundStyle(.secondaryGray)
                        }
                        Spacer()
                        Image("chevron-right")
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.accentBlack)
                    }
                }
                .disabled(true)
            }
        }
        .padding(15)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.secondaryBackground)
        )
    }
}

#Preview {
    AdditionalInfoView(additionalData: [AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy"), AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy"), AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy")])
}
