//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var statictics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinNetworkManager()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
     
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellable)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercaseText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercaseText) ||
                   coin.symbol.lowercased().contains(lowercaseText) ||
                   coin.id.lowercased().contains(lowercaseText)
        }
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
