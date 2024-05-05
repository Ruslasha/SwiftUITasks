//
//  PurchaseView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 05.05.2024.
//

import Foundation
import SwiftUI

struct PurchaseView: View {
    
    private enum Constants {
        static let privacyText = "Privacy Matters"
        static let protectText = "Protect your online activities with VPN Plus"
        static let adressText = "IP Address"
        static let adressNumbers = "127.0.0.1"
        static let receivedText = "Received"
        static let mbText = "0 MB"
        static let sentText = "Sent"
    }

    @EnvironmentObject var vpnViewModel: VPNViewModel
    @State private var isShowAlert: Bool = false
    @Binding var selectedTabBarItem: Int
    
    var body: some View {
        VStack{
            Text(Constants.privacyText)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text(Constants.protectText)

            ScrollView(showsIndicators: false){
                ForEach(vpnViewModel.cases, id: \.self){ item in
                    ItemView(isSelected: item == vpnViewModel.selectedItems, vpnItem: item, actionHandler: {
                        if item == vpnViewModel.selectedItems {
                            vpnViewModel.deleteItem()
                        } else {
                            vpnViewModel.selectedItem(selectedItems: item)
                            isShowAlert.toggle()
                        }
                    })
                }
            }
        }
    }
}

struct ItemView: View {
    
    private enum Constants {
        static let calendarImage = "calendar"
        static let buttonTitle = "Buy"
        static let addedButton = "Added"
    }
    var isSelected: Bool
    let vpnItem: VPN
    let actionHandler: () -> ()
    
    var body: some View {
        VStack {
            ZStack{
                Image(Constants.calendarImage)
                    .frame(width: 120, height: 120)
                Text(String(vpnItem.days))
                    .padding(.top)
                    .font(.title)
                    .foregroundStyle(.black)
            }
            Text(vpnItem.title)
            Button {
                actionHandler()
            } label: {
                Text(!isSelected ? Constants.buttonTitle : Constants.addedButton)
                    .padding()
                    .frame(width: 100)
                    .background(isSelected ? .appAdded : Color.blue)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}
