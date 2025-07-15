//
//  DefaultSectionHeaderRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct DefaultSectionHeaderRender: HeaderRenderer {
    func render(header: CommonSection) -> AnyView {
        AnyView(DefaultSectionHeader(title: header.name))
    }
}

struct DefaultSectionHeader: View {
    let title: String
    var action: (() -> Void)?
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .font(.subheadline)
                .foregroundColor(.primary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.primary)
        }
        .padding(.vertical, 12)
    }
}
