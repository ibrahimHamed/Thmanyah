//
//  SearchSectionDTO.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct SearchSectionDTO: Codable {
    let name: String?
    let type: String?
    let contentType: String?
    let order: String?
    let content: [SearchContentDTO]?

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order, content
    }
}
