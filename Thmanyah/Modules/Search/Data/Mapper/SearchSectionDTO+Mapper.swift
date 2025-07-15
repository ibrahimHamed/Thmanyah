//
//  SearchSectionDTO+Mapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension SearchSectionDTO {
    func toDomain() -> CommonSection {
        .init(
            name: name ?? "",
            type: SectionType(from: type),
            contentType: ContentType(from: contentType),
            order: Int(order ?? "0") ?? 0,
            content: content?.compactMap { $0.toDomain() } ?? []
        )
    }
}
