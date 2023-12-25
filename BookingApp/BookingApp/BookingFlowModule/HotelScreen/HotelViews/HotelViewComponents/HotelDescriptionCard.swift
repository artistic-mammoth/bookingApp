//
//  HotelDescriptionCard.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct HotelDescriptionCard: View {
    // MARK: - Public properties
    var peculiarities: [String]
    var description: String
    var additionalButtonsData: [AdditionalInfo]
    
    // MARK: - View body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TextComponents.header("Об отеле")
                .padding(.bottom, 16)
            
            TagView(tags: peculiarities)
                .padding(.bottom, 12)
            
            TextComponents.main(description)
                .padding(.bottom, 16)
            
            AdditionalInfoView(additionalData: additionalButtonsData)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
        )
    }
}

#Preview {
    HotelDescriptionCard(peculiarities: ["3-я линия", "Платный Wi-Fi в фойе"], description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!", additionalButtonsData: [AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy"), AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy"), AdditionalInfo(header: "Удобства", secondaryText: "Самое необходимое", iconName: "emoji-happy")])
}
