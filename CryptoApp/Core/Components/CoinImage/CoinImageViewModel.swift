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

/*
 class CoinImageServices {
     
     @Published var image: UIImage? = nil
     
     private var imageSubscription: AnyCancellable?
     private let coin: CoinModel
     
     init(coin: CoinModel) {
         self.coin = coin
         getCoinImage()
     }
     
     private func getCoinImage() {
         guard let url = URL(string: coin.image) else { return }
         
         imageSubscription = NetworkManager.shared.download(url: url)
             .tryMap({ (data) -> UIImage? in
                 return UIImage(data: data)
             })
             .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] returnedImage in
                 self?.image = returnedImage
                 self?.imageSubscription?.cancel()
             })
     }

 }
 */
