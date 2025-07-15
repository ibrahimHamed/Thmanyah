//
//  SearchDTO+Mapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension SearchDTO {
    func toDomain() -> Search {
        .init(sections: sections?.compactMap { $0.toDomain() } ?? [])
    }
}
