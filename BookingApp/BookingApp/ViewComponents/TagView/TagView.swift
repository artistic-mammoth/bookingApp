//
//  TagView.swift
//  BookingApp
//
//  Created by Михайлов Александр on 24.12.2023.
//

import SwiftUI

struct TagView: View {
    // MARK: - Public methods
    var tags: [String]
    @State private var totalHeight = CGFloat.zero
    
    // MARK: - View body
    var body: some View {
        VStack {
            GeometryReader { proxy in
                self.generateContent(in: proxy)
            }
        }
        .frame(height: totalHeight)
    }
}

// MARK: - Private extension
private extension TagView {
    // MARK: - Methods
    func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        var lastHeight = CGFloat.zero
        let itemCount = tags.count
        
        return ZStack(alignment: .topLeading) {
            ForEach(Array(tags.enumerated()), id: \.offset) { index, item in
                TagCell(label: item)
                    .padding(4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width) {
                            width = 0
                            height -= lastHeight
                        }
                        lastHeight = d.height
                        let result = width
                        if index == itemCount - 1 {
                            width = 0
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { d in
                        let result = height
                        if index == itemCount - 1 {
                            height = 0
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }
    
    func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: HeightPreferenceKey.self, value: proxy.frame(in: .local).size.height)
        }
        .onPreferenceChange(HeightPreferenceKey.self) { height in
            binding.wrappedValue = height
        }
    }
    
    // MARK: - Structures
    struct HeightPreferenceKey: PreferenceKey {
        static func reduce(value _: inout CGFloat, nextValue _: () -> CGFloat) {}
        static var defaultValue: CGFloat = 0
    }
}

#Preview {
    TagView(tags: ["cat", "dog"])
}
