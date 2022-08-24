//
//  CoinDataManager.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import Foundation
import Combine

class CoinNetworkManager {

    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: CryptoURL.coinUrl.rawValue) else { return }
        
        coinSubscription = NetworkManager.shared.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
        
        /*
         func handleCompletion(completion: Subscribers.Completion<Error>) {
         switch completion {
         case .finished:
         break
         case .failure(let error):
         print(error.localizedDescription)
         }
         }
         */

    }
 
}
