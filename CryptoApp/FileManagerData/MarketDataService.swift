//
//  MarketDataService.swift
//  CryptoApp
//
//  Created by Maksim  on 26.08.2022.
//

import Foundation
import Combine

class MarketDataService {

    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: CryptoURL.globalCoinURL.rawValue) else { return }
        
        marketDataSubscription = NetworkManager.shared.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
 
}
