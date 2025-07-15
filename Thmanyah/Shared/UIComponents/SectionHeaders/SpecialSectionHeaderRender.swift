//
//  SpecialSectionHeaderRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct SpecialSectionHeaderRender: HeaderRenderer {
    func render(header: CommonSection) -> AnyView {
        AnyView(SpecialSectionHeader(title: header.name))
    }
}

struct SpecialSectionHeader: View {
    let title: String
    var action: (() -> Void)?
    var body: some View {
        HStack(spacing: 8) {
            Text(title)
                .bold()
                .font(.subheadline)
                .foregroundStyle(.goldenYellow)
            Image(systemName: "star.circle")
                .foregroundStyle(.goldenYellow)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.goldenYellow)
        }
        .padding(.vertical, 12)
    }
}
