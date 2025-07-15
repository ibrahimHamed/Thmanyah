//
//  HorizontalScrollList.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct HorizontalScrollList<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Identifiable, Content: View {
    let data: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content

    init(data: Data, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.data = data
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(data) { item in
                    content(item)
                }
            }
        }
    }
}
