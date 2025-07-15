//
//  String+Ext.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 13/07/2025.
//

import Foundation

extension String {
    func relativeDateDescription() -> String? {
        let formatters: [ISO8601DateFormatter] = {
            let formatter1 = ISO8601DateFormatter()
            formatter1.formatOptions = [.withInternetDateTime]
            
            let formatter2 = ISO8601DateFormatter()
            formatter2.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            
            return [formatter1, formatter2]
        }()
        
        var parsedDate: Date?
        
        for formatter in formatters {
            if let date = formatter.date(from: self) {
                parsedDate = date
                break
            }
        }
        
        guard let date = parsedDate else {
            return nil
        }
        
        let relativeFormatter = RelativeDateTimeFormatter()
        relativeFormatter.unitsStyle = .short
        
        return relativeFormatter.localizedString(for: date, relativeTo: Date())
    }
    
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        let greeting: String
        switch hour {
        case 5..<12:
            greeting = "Good morning"
        case 12..<17:
            greeting = "Good afternoon"
        case 17..<21:
            greeting = "Good evening"
        default:
            greeting = "Good night"
        }
        
        return "\(greeting), \(self)"
    }
}
