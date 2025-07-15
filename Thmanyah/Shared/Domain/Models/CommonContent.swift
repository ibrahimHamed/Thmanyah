//
//  CommonContent.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct CommonContent: Identifiable {
    let id = UUID().uuidString
    let podcastID: String?
    let episodeID: String?
    let audiobookID: String?
    let articleID: String?
    let name: String
    let description: String?
    let avatarURL: String?
    let duration: String?
    let authorName: String?
    let score: Double?
    let releaseDate: String?
    let audioURL: String?
}
