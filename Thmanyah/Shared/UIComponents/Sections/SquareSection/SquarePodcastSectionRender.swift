//
//  SquarePodcastSectionRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
import SwiftUI

struct SquarePodcastSectionRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(SquarePodcastSectionView(contents: section.content))
    }
}

private struct SquarePodcastSectionView: View {
    let contents: [CommonContent]
    let size: CGSize

    init(contents: [CommonContent], itemSize: CGFloat = 150) {
        self.contents = contents
        self.size = CGSize(width: itemSize, height: itemSize)
    }

    var body: some View {
        HorizontalScrollList(data: contents) { content in
            SquarePodcastItemView(content: content, imageSize: size)
                .frame(width: size.width)
        }
    }
}

struct SquarePodcastItemView: View {
    let content: CommonContent
    let imageSize: CGSize

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            imageView
            titleView
            playButtonView
        }
    }

    private var imageView: some View {
        AsyncImageView(
            stringURL: content.avatarURL,
            size: imageSize
        )
        .roundedCorner(.small)
    }

    private var titleView: some View {
        Text(content.name)
            .font(.caption)
            .fontWeight(.bold)
            .lineLimit(1)
            .foregroundColor(.primary)
    }

    private var playButtonView: some View {
        HStack {
            if let duration = content.duration {
                PlayButton(duration: duration)
                    .frame(height: 20)
                Spacer()
            }
        }
        .padding(.bottom, 4)
    }
}
