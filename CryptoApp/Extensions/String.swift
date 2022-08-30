//
//  String.swift
//  CryptoApp
//
//  Created by Maksim  on 30.08.2022.
//

import Foundation

extension String {
    
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    
    
    
    
    
}
