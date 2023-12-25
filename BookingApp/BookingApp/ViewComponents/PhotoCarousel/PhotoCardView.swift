//
//  PhotoCardView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 25.12.2023.
//

import SwiftUI

struct PhotoCardView: View {
    // MARK: - Public properties
    var imageURL: String
    
    // MARK: - View body
    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: proxy.size.width)
            } placeholder: {
                ProgressView()
                    .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
            }
            .clipped()
        }
    }
}

#Preview {
    PhotoCardView(imageURL: "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg")
}
