//
//  Int+Ext.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//

import Foundation

extension Int {
    func formattedHoursAndMinutes() -> String {
        let totalMinutes = self / 60
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60

        var components: [String] = []
        if hours > 0 {
            components.append("\(hours) hr")
        }
        if minutes > 0 {
            components.append("\(minutes) m")
        }

        return components.joined(separator: " ")
    }
}
