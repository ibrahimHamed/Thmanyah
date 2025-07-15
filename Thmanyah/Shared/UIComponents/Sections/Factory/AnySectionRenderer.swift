//
//  AnySectionRenderer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct AnySectionRenderer: SectionRenderer {
    private let _render: (CommonSection) -> AnyView

    init<R: SectionRenderer>(_ renderer: R) {
        self._render = renderer.render
    }

    func render(section: CommonSection) -> AnyView {
        _render(section)
    }
} 
