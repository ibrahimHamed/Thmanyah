//
//  BigSquareAudioBookSectionRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import SwiftUI

struct BigSquareAudioBookSectionRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(BigSquareAudioBookSectionView(contents: section.content))
    }
}

private struct BigSquareAudioBookSectionView: View {
    let contents: [CommonContent]

    var body: some View {
        HorizontalScrollList(data: contents, spacing: 16) { content in
            BigSquareAudioBookItemView(content: content, size: .init(width: 225, height: 150))
        }
    }
}

private struct BigSquareAudioBookItemView: View {
    let content: CommonContent
    let size: CGSize

    private var imageSize: CGSize {
        CGSize(width: size.width, height: size.height)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImageView(stringURL: content.avatarURL, size: imageSize)
            overlay
        }
        .frame(width: imageSize.width, height: imageSize.height)
        .roundedCorner(.small)
    }

    private var overlay: some View {
        VStack {
            Spacer()
            Text(content.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.3))
    }
}
