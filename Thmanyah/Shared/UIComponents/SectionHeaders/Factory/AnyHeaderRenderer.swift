//
//  AnyHeaderRenderer.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//
import SwiftUI

struct AnyHeaderRenderer: HeaderRenderer {
    private let _render: (CommonSection) -> AnyView

    init<R: HeaderRenderer>(_ renderer: R) {
        self._render = renderer.render
    }

    func render(header: CommonSection) -> AnyView {
        _render(header)
    }
}
