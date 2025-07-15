//
//  HomePaginationDTO.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct HomePaginationDTO: Codable {
    var nextPage: String?
    var totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}
