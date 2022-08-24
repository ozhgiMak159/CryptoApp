//
//  CoinNetworkImage.swift
//  CryptoApp
//
//  Created by Maksim  on 24.08.2022.
//

import SwiftUI
import Combine

class CoinNetworkImage {
    
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
