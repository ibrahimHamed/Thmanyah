//
//  ContentType.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

enum ContentType: String {
    case podcast
    case episode
    case audioBook = "audio_book"
    case audioArticle = "audio_article"
    case unknown

    init(from rawValue: String?) {
        guard let value = rawValue?.lowercased().replacingOccurrences(of: "_", with: "") else {
            self = .unknown
            return
        }

        switch value {
        case "podcast":
            self = .podcast
        case "episode":
            self = .episode
        case "audiobook":
            self = .audioBook
        case "audioarticle":
            self = .audioArticle
        default:
            self = .unknown
        }
    }
}
