//
//  HomeViewModel.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    
    private let dataService = CoinDataManager()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (reternedCoins) in
                self?.allCoins = reternedCoins
            }
            .store(in: &cancellables)
    }
    
    
}
