//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Maksim  on 30.08.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let personalURL = URL(string: "https://github.com/ozhgiMak159")!
    let appGitHubUrl = URL(string: "https://github.com/ozhgiMak159/CryptoApp")!
    let apiCoin = URL(string: "https://www.coingecko.com/ru")!
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                
                List {
                    informationApp
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    coinGeckoSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                    developerSection
                        .listRowBackground(Color.theme.background.opacity(0.5))
                }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarksButton {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var informationApp: some View {
        Section(header: Text("CryptoApp")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: personalURL) {
                Text("Welcome my profile Github 🧔🏻‍♂️")
            }
            Link(destination: appGitHubUrl) {
                Text("CryptoApp 👨🏻‍💻")
            }
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CryptoApp")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: apiCoin) {
                Text("Api Coin")
            }
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("CryptoApp")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Описания разработчика и профиль в гитхаб")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link(destination: personalURL) {
                Text("ГитХаб")
            }
        }
    }
    
    
    
}
