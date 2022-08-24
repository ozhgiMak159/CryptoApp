//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    private let dataService = CoinNetworkManager()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.portfolioCoin = returnedCoins
            }
            .store(in: &cancellable)
    }

}

/*
 class CoinDataManager {

     @Published var allCoins: [CoinModel] = []
     var coinSubscription: AnyCancellable?
     
     init() {
         getCoins()
     }
     
     private func getCoins() {
         guard let url = URL(string: Url.coinUrl.rawValue) else { return }
         
         coinSubscription = NetworkManager.shared.download(url: url)
             .decode(type: [CoinModel].self, decoder: JSONDecoder())
             .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] returnedCoins in
                 self?.allCoins = returnedCoins
                 self?.coinSubscription?.cancel()
             })
     }
  
 }
 */
