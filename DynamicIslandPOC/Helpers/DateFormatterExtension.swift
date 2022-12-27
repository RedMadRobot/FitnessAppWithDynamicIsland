//
//  DateFormatterExtension.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 27.10.2022.
//

import Foundation

extension DateFormatter {
    
    public static func currentHumanReadableFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMM dd, EEE"
        return formatter
    }
}
