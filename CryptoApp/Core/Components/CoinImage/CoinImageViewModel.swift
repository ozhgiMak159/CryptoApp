//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private let coin: CoinModel
    private let coinImageServices: CoinNetworkImage
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.coinImageServices = CoinNetworkImage(coin: coin)
        self.addSubscribes()
        self.isLoading = true
    }
    
    private func addSubscribes() {
        coinImageServices.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.image = returnedImage
            }
            .store(in: &cancellable)
    }
}


