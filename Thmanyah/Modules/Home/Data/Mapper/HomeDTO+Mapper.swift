//
//  HomeMapper.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

extension HomeDTO {
    func toDomain() -> Home {
        .init(
            sections: sections?.compactMap { $0.toDomain() } ?? [],
            pagination: pagination?.toDomain()
        )
    }
}
