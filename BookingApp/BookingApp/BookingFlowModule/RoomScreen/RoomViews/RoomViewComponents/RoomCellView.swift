//
//  RoomCellView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct RoomCellView: View {
    // MARK: - Public properties
    @State var roomData: RoomData
    
    // MARK: - View body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PhotoCarousel(imageURLs: roomData.imageUrls)
                .frame(height: 257)
                .padding(.bottom, 8)
            
            TextComponents.header(roomData.name)
                .padding(.bottom, 8)
            
            TagView(tags: roomData.peculiarities)
                .padding(.bottom, 8)
            
            MoreDetailsButton(action: {})
            .padding(.bottom, 16)
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                TextComponents.price(roomData.price)
                    .padding(.trailing, 7)
                
                TextComponents.main(roomData.pricePer)
                    .foregroundStyle(.secondaryGray)
            }
            .padding(.bottom, 16)
            
            ActiveButton(action: {}, label: "Выбрать номер")
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
        )
    }
}

#Preview {
    RoomCellView(roomData: RoomData(name: "Стандартный с видом на бассейн или сад", price: "186 600 ₽", pricePer: "за 7 ночей с перелётом", peculiarities: ["Все включено", "Кондиционер"], imageUrls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"]))
}
