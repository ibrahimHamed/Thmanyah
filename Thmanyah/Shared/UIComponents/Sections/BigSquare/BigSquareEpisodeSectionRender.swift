//
//  BigSquareEpisodeSectionRender.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import SwiftUI

struct BigSquareEpisodeSectionRender: SectionRenderer {
    func render(section: CommonSection) -> AnyView {
        return AnyView(BigSquareEpisodeSectionView(contents: section.content))
    }
}

private struct BigSquareEpisodeSectionView: View {
    let contents: [CommonContent]
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.height
    }
    
    var body: some View {
        HorizontalScrollList(data: contents, spacing: 16) { content in
            BigSquareEpisodeItemView(content: content, size: .init(width: 225, height: 150))
        }
    }
}

private struct BigSquareEpisodeItemView: View {
    let content: CommonContent
    let size: CGSize
    
    private enum Constants {
        static let frameScale: CGFloat = 0.75
        static let heightOffset: CGFloat = 50
        static let padding: CGFloat = 24
        static let bottomPadding: CGFloat = 32
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImageView(
                stringURL: content.avatarURL,
                size: size
            )
            .overlay(gradientOverlay)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(content.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                if let releaseDate = content.releaseDate {
                    Text(releaseDate)
                        .font(.caption2)
                        .lineLimit(1)
                        .truncationMode(.middle)
                        .foregroundColor(.primary)
                }
            }
            .padding()
        }
        .frame(
            width: size.width,
            height: size.height
        )
        .roundedCorner(.small)
        
    }
    
    private var gradientOverlay: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(.systemBackground).opacity(0.9),
                Color(.systemBackground).opacity(0.2)
            ]),
            startPoint: .bottom,
            endPoint: .top
        )
    }
}
