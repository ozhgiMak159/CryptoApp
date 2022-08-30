//
//  Color.swift
//  CryptoApp
//
//  Created by Maksim  on 23.08.2022.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let greenColor = Color("GreenColor")
    let redColor = Color("RedColor")
    let secondaryTextColor = Color("SecondaryTextColor")

}

//struct ColorTheme2 {
//    let accent = Color(#colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1))
//    let background = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
//    let greenColor = Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))
//    let redColor = Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))
//    let secondaryTextColor = Color(#colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1))
//}


struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}
