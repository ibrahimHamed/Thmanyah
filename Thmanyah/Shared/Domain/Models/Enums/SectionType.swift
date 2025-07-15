//
//  SectionType.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//
import Foundation

enum SectionType: String {
    case square
    case bigSquare = "big square"
    case twoLinesGrid = "2_lines_grid"
    case queue
    case unknown

    init(from rawValue: String?) {
        guard let value = rawValue?.lowercased().replacingOccurrences(of: "_", with: " ") else {
            self = .unknown
            return
        }

        switch value {
        case "square":
            self = .square
        case "big square":
            self = .bigSquare
        case "2 lines grid":
            self = .twoLinesGrid
        case "queue":
            self = .queue
        default:
            self = .unknown
        }
    }
}
