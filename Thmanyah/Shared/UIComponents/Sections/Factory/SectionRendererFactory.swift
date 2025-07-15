//
//  SectionRendererFactory.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct SectionRendererFactory {
    func makeRenderer(for section: CommonSection) -> AnyView {
        switch (section.type, section.contentType) {
        case (.bigSquare?, .audioBook?):
            return BigSquareAudioBookSectionRender().render(section: section)
        case (.bigSquare?, .episode?):
            return BigSquareEpisodeSectionRender().render(section: section)
        case (.square?, .audioArticle?):
            return SquareAudioArticleRender().render(section: section)
        case (.square?, .podcast?):
            return SquarePodcastSectionRender().render(section: section)
        case (.twoLinesGrid?, .audioBook?):
            return TwoLineGridAudioBookSectionRender().render(section: section)
        case (.twoLinesGrid?, .episode?):
            return TwoLineGridEpisodeSectionRender().render(section: section)
        case (.queue?, .podcast?):
            return QueuePodcastSectionRender().render(section: section)
        default:
            return SquareAudioArticleRender().render(section: section)
        }
    }
}
