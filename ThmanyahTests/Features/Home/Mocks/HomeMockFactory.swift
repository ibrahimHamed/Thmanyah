//
//  HomeMockFactory.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//

import Foundation
@testable import Thmanyah

enum HomeMockFactory {
    static func makeMockHomeDTO() -> HomeDTO {
        HomeDTO(
            sections: [
                HomeSectionDTO(
                    name: "section-1",
                    type: "big_Square",
                    contentType: "audio_book",
                    order: 1,
                    content: [
                        HomeContentDTO(
                            podcastID: "1",
                            name: "content-1",
                            description: "description"
                        )
                    ]
                )
            ],
            pagination: HomePaginationDTO(
                nextPage: "2",
                totalPages: 10
            )
        )
    }
    
    static func makeDomainHome() -> Home {
        makeMockHomeDTO().toDomain()
    }
    
    static func makeMinimalHomeDTO() -> HomeDTO {
        HomeDTO(
            sections: [
                HomeSectionDTO(
                    type: nil,
                    contentType: nil,
                    content: []
                )
            ],
            pagination: HomePaginationDTO(
                nextPage: "2",
                totalPages: 10
            )
        )
    }
}
