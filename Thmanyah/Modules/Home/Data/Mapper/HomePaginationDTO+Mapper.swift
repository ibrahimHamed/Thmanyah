//
//  HomePaginationDTO+Mapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension HomePaginationDTO {
    func toDomain() -> Pagination {
        .init(
            nextPage: nextPage,
            totalPages: totalPages ?? 0
        )
    }
}
