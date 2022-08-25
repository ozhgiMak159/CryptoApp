//
//  HomeStatisticView.swift
//  CryptoApp
//
//  Created by Maksim  on 25.08.2022.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject private var homeModel: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(homeModel.statictics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio
                                                             ? .trailing : .leading)
    }
}

struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatisticView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
