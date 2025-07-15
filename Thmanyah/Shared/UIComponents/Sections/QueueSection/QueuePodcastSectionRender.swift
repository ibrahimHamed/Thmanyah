//
//  QueuePodcastSectionRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation
import SwiftUI

struct QueuePodcastSectionRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(QueuePodcastSectionView(contents: section.content))
    }
}

private struct QueuePodcastSectionView: View {
    let contents: [CommonContent]

    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var body: some View {
        HorizontalScrollList(data: contents) { content in
            QueuePodcastItemView(content: content)
                .frame(width: screenWidth * 0.65, height: 100)
        }
    }
}

private struct QueuePodcastItemView: View {
    let content: CommonContent

    var body: some View {
        HStack(spacing: 12) {
            coverImage
            contentInfo
        }
        .background(Color(.systemBackground))
        .roundedCorner(.small)
    }

    private var coverImage: some View {
        AsyncImageView(
            stringURL: content.avatarURL,
            size: CGSize(width: 100, height: 100)
        )
    }

    private var contentInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            titleText
            durationText
            Spacer()
            scoreTag
        }
    }

    private var titleText: some View {
        Text(content.name)
            .font(.caption)
            .fontWeight(.bold)
            .lineLimit(2)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primary)
    }

    @ViewBuilder
    private var durationText: some View {
        if let duration = content.duration {
             Text(duration)
                .font(.caption)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var scoreTag: some View {
        HStack {
            if let score = content.score {
                Text(String(format: "%.1f", score))
                    .font(.caption2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .foregroundColor(.primary)
                    .background(Color(.systemGray5))
                    .clipShape(Capsule())
            }
            Spacer()
        }
        .padding(.bottom, 2)
    }
}
