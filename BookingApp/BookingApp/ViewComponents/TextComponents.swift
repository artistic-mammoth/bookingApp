//
//  TextComponents.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import SwiftUI

struct TextComponents {
    
    private static let SFProDisplayRegular = "SFProDisplay-Regular"
    private static let SFProDisplayMedium = "SFProDisplay-Medium"
    private static let SFProDisplaySemibold = "SFProDisplay-Semibold"
    
    static func main(_ text: String, size: CGFloat = 16) -> some View {
        Text(text)
            .font(.custom(SFProDisplayRegular, size: size))
    }
    
    static func header(_ text: String, size: CGFloat = 22) -> some View {
        Text(text)
            .font(.custom(SFProDisplayMedium, size: size))
    }
    
    static func footer(_ text: String, size: CGFloat = 14) -> some View {
        Text(text)
            .font(.custom(SFProDisplayMedium, size: size))
    }
    
    static func price(_ text: String, size: CGFloat = 30) -> some View {
        Text(text)
            .font(.custom(SFProDisplaySemibold, size: size))
    }
    
    static func mainMedium(_ text: String, size: CGFloat = 16) -> some View {
        Text(text)
            .font(.custom(SFProDisplayMedium, size: size))
    }
    
    static func navigationTitle(_ text: String, size: CGFloat = 18) -> some View {
        Text(text)
            .font(.custom(SFProDisplayMedium, size: size))
    }
}
