//
//  CommonSection.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

struct CommonSection: Identifiable {
    let id = UUID()
    let name: String
    let type: SectionType?
    let contentType: ContentType?
    let order: Int
    let content: [CommonContent]
}
