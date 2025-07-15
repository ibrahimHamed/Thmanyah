//
//  View+Ext.swift
//  Thmanyah
//
//  Created by Ibrahim Hamed on 12/07/2025.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
