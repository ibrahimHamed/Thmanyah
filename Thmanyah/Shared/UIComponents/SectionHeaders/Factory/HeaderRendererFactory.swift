//
//  HeaderRendererFactory.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct HeaderRendererFactory {
    func makeHeaderView(for section: CommonSection) -> AnyView {
        switch section.type {
        case .square:
            return SpecialSectionHeaderRender().render(header: section)
        default:
            return DefaultSectionHeaderRender().render(header: section)
        }
    }
}
