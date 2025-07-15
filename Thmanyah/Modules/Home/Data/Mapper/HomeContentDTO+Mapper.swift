//
//  HomeContentDTO+Mapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension HomeContentDTO {
    func toDomain() -> CommonContent {
        .init(
            podcastID: podcastID,
            episodeID: episodeID,
            audiobookID: audiobookID,
            articleID: articleID,
            name: name ?? podcastName ?? "",
            description: description,
            avatarURL: avatarURL,
            duration: duration?.formattedHoursAndMinutes(),
            authorName: authorName,
            score: score,
            releaseDate: releaseDate?.relativeDateDescription(),
            audioURL: audioURL ?? separatedAudioURL ?? paidEarlyAccessAudioURL
        )
    }
}
