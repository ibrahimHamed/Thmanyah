//
//  SquareAudioArticleRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import SwiftUI

struct SquareAudioArticleRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(SquareAudioArticleSectionView(contents: section.content))
    }
}

private struct SquareAudioArticleSectionView: View {
    let contents: [CommonContent]
    private let size: CGSize = .init(width: 150, height: 150)

    var body: some View {
        HorizontalScrollList(data: contents) { content in
            SquareAudioArticleItemView(content: content,
                                       imageSize: size)
            .frame(width: size.width)
        }
    }
}

private struct SquareAudioArticleItemView: View {
    let content: CommonContent
    let imageSize: CGSize

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            coverImage
            titleText
            bottomInfo
        }
    }

    private var coverImage: some View {
        AsyncImageView(
            stringURL: content.avatarURL,
            size: imageSize
        )
        .roundedCorner(.small)
    }

    private var titleText: some View {
        Text(content.name)
            .font(.caption)
            .fontWeight(.bold)
            .lineLimit(1)
            .foregroundColor(.primary)
    }

    private var bottomInfo: some View {
        HStack {
            if let duration = content.duration {
                PlayButton(duration: duration)
            }

            Spacer()

            if let releaseDate = content.releaseDate {
                Text(releaseDate)
                    .font(.caption2)
                    .lineLimit(1)
                    .truncationMode(.middle)
                    .foregroundColor(.primary)
            }
        }
    }
}
