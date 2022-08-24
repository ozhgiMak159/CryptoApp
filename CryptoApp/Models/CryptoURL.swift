//
//  CryptoURL.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import Foundation

enum CryptoURL: String {
    case coinUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
}
