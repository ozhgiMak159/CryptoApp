//
//  Date.swift
//  CryptoApp
//
//  Created by Maksim  on 29.08.2022.
//

import Foundation

extension Date {
    
    
    init(coinGeckoString: String) {
        let formetter = DateFormatter()
        formetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formetter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
    
    
}
