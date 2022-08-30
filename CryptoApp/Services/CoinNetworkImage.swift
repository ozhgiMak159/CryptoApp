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
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let saveImage = LocalFileManager.shared.getImage(imageName: imageName, folderName: "coin_images") {
            image = saveImage
          //  print("Retrieved image from File Manager!")
            // Сохранения в кэш
        } else {
            downloadCoinImage()
           // print("Downloading image now")
            // Загруска изи сети
        }
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubscription = NetworkManager.shared.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkManager.shared.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                LocalFileManager.shared.saveImage(image: downloadedImage, imageName: self.imageName, folderName: "coin_images")
            })
    }

}
