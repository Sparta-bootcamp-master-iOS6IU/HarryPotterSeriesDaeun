//
//  String+Extension.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/31/25.
//

import Foundation

extension String {
    func formattedDate(from inputFormat: DateFormat, to outputFormat: DateFormat) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = inputFormat.rawValue
        
        guard let date = inputFormatter.date(from: self) else { return nil }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = outputFormat.rawValue
        
        return outputFormatter.string(from: date)
    }
}
