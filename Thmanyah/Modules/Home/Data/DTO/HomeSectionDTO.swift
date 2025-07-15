//
//  HomeSectionDTO.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct HomeSectionDTO: Codable {
    var name: String?
    var type: String?
    var contentType: String?
    var order: Int?
    var content: [HomeContentDTO]?

    enum CodingKeys: String, CodingKey {
        case name, type
        case contentType = "content_type"
        case order, content
    }
}
