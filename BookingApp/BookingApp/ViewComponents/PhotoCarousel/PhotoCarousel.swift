//
//  PhotoCarousel.swift
//  BookingApp
//
//  Created by Михайлов Александр on 23.12.2023.
//

import SwiftUI

struct PhotoCarousel: View {
    // MARK: - Public properties
    var imageURLs: [String]
    
    // MARK: - Private properties
    @State private var currentIndex: Int = 0
    
    // MARK: - View body
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(0..<imageURLs.count, id: \.self) { index in
                    PhotoCardView(imageURL: imageURLs[index])
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
            indicators()
                .offset(y: -8)
        }
    }
}

// MARK: - Private extension
private extension PhotoCarousel {
    func indicators() -> some View {
        HStack(spacing: 5) {
            ForEach(0..<imageURLs.count, id: \.self) { index in
                
                let opacity: Double = 0.22 - min(0.17, 0.05 * Double(abs(index-currentIndex)))
                
                Circle()
                    .fill(.black.opacity(currentIndex == index ? 1 : opacity))
                    .frame(width: 7, height: 7)
                    .onTapGesture {
                        currentIndex = index
                    }
            }
        }
        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
    }
}

#Preview {
    PhotoCarousel(imageURLs: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg", "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg", "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"])
}
