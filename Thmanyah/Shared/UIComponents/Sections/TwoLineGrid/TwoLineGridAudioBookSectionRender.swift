//
//  TwoLineGridAudioBookSectionRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import Foundation
import SwiftUI

struct TwoLineGridAudioBookSectionRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(TwoLineGridAudioBookSectionView(contents: section.content))
    }
}

struct TwoLineGridAudioBookSectionView: View {
    let contents: [CommonContent]
    private let rows: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, spacing: 15) {
                ForEach(contents) { content in
                    TwoLineGridAudioBookItemView(content: content)
                        .frame(width: screenWidth * 0.8)
                        .frame(height: 130)
                }
            }
        }
    }
}

struct TwoLineGridAudioBookItemView: View {
    let content: CommonContent

    var body: some View {
        HStack(spacing: 15) {
            AsyncImageView(
                stringURL: content.avatarURL,
                size: CGSize(
                    width: 100,
                    height: 100
                )
            )
            .roundedCorner(.small)
            TwoLineGridAudioBookItemInfo(content: content)
        }
    }
}

private struct TwoLineGridAudioBookItemInfo: View {
    var content: CommonContent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            titleText
            descriptionText
            bottomActions
        }
    }
    
    private var releaseDateText: some View {
        Group {
            if let releaseDate = content.releaseDate {
                Text(releaseDate)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    private var titleText: some View {
        HStack(spacing: 8) {
            Text(content.name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .lineLimit(2)
            Spacer()
            releaseDateText
        }
            
    }
    
    private var descriptionText: some View {
        Text(content.description ?? "")
            .font(.footnote)
            .foregroundColor(.primary)
            .lineLimit(2)
    }
    
    private var bottomActions: some View {
        HStack(spacing: 8) {
            if let duration = content.duration {
                PlayButton(duration: duration)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            moreOptionsButton
        }
    }
    
    private var moreOptionsButton: some View {
        Button(action: {}, label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(Color.primary)
        })
    }
    
    private var addToPlaylistButton: some View {
        Button(action: {}, label: {
            Image(.addToPlaylist)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.primary)
        })
    }
}
