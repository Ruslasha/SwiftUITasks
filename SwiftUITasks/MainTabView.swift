//
//  ContentView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 29.04.2024.
//

import SwiftUI

struct MainTabView: View {
    
    enum Constants {
        static let vpnLabel = "VPN"
        static let purchaseLabel = "Purchase"
        static let basketLabel = "Basket"
        static let vpnImage = "vpn"
        static let purchaseImage = "purchase"
        static let basketImage = "basket"
    }

    @ObservedObject var vpnViewModel = VPNViewModel()
    @State private var selected = 0

    var body: some View {
        TabView(selection: $selected) {
            VPNView()
                .tabItem {
                    Label(Constants.vpnLabel, image: Constants.vpnImage)
                }
                .tag(0)
            PurchaseView(selectedTabBarItem: $selected)
                .environmentObject(vpnViewModel)
                .tabItem {
                    Label(Constants.purchaseLabel, image: Constants.purchaseImage)
                }
                .tag(1)
            BasketView()
                .environmentObject(vpnViewModel)
                .tabItem {
                    Label(Constants.basketLabel, image: Constants.basketImage)
                }
                .tag(2)
            
        }
    }
}

#Preview {
    MainTabView()
}
