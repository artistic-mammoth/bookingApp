//
//  HotelInfoCard.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct HotelInfoCard: View {
    // MARK: - Public properties
    var imageURLs: [String]
    var raitingText: String
    var hotelName: String
    var hotelAdress: String
    var minimalPrice: String
    var priceForItText: String
    
    //MARK: - View body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PhotoCarousel(imageURLs: imageURLs)
                .frame(height: 257)
                .padding(.bottom, 16)
            
            RaitingLabel(text: raitingText)
                .padding(.bottom, 8)
            
            TextComponents.header(hotelName)
                .padding(.bottom, 8)
            
            AdressButton(action: {}, label: hotelAdress)
                .padding(.bottom, 16)
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                TextComponents.price(minimalPrice)
                    .padding(.trailing, 8)
                
                TextComponents.main(priceForItText)
                    .foregroundStyle(.secondaryGray)
            }
        }
        .padding([.horizontal, .bottom], 16)
        .background(
            UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 12, bottomTrailingRadius: 12, topTrailingRadius: 0, style: .continuous)
                .fill(.white)
        )
    }
}

#Preview {
    HotelInfoCard(imageURLs: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"], raitingText: "5 Превосходно", hotelName: "Steigenberger Makadi", hotelAdress: "Madinat Makadi, Safaga Road, Makadi Bay, Египет", minimalPrice: "от 134 673 ₽", priceForItText: "за тур с перелётом")
}
