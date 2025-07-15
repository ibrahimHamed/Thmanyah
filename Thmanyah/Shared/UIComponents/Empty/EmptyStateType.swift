//
//  EmptyStateType.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 14/07/2025.
//
import Foundation

enum EmptyStateType {
    case noContent
    case noResults
    case search
    case custom(title: String, icon: String)

    var title: String {
        switch self {
        case .noContent:
            return "No content available"
        case .noResults:
            return "No results found"
        case .search:
            return "Start typing to search."
        case .custom(let title, _):
            return title
        }
    }

    var icon: String {
        switch self {
        case .noContent:
            return "tray"
        case .noResults:
            return "text.page.badge.magnifyingglass"
        case .search:
            return "magnifyingglass"
        case .custom(_, let icon):
            return icon
        }
    }
}
