//
//  SearchContentDTO+Mapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension SearchContentDTO {
    func toDomain() -> CommonContent {
        let durationString = duration ?? "0"
        let durationSeconds = Int(durationString) ?? 0
        let readableDuration = durationSeconds.formattedHoursAndMinutes()
        
        return CommonContent(
                podcastID: podcastID,
                episodeID: episodeID,
                audiobookID: audiobookID,
                articleID: articleID,
                name: name ?? podcastName ?? "Unknown",
                description: description,
                avatarURL: avatarURL,
                duration: readableDuration,
                authorName: authorName ?? "Unknown",
                score: Double(score ?? "0.0"),
                releaseDate: releaseDate?.relativeDateDescription(),
                audioURL: audioURL ?? separatedAudioURL ?? paidEarlyAccessAudioURL
            )
    }
}
