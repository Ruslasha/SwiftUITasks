//
//  BasketView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 05.05.2024.
//

import Foundation
import SwiftUI

struct BasketView: View {
    
    @EnvironmentObject var vpnViewModel: VPNViewModel
    @State private var isShowAlert = false
    
    var body: some View {
        VStack{
            Text("You choosed")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text("Please check and pay the selected tariff")
            if let item = vpnViewModel.selectedItems {
                ItemBusketView(vpnItem: item) {
                    isShowAlert.toggle()
                }.alert("Успех", isPresented: $isShowAlert) {
                    
                } message: {
                    Text("Вы приобрели \(item.title)")
                }
            }
            Spacer()
        }
        
    }
}

struct ItemBusketView: View {
    private enum Constants {
        static let calendarImage = "calendar"
        static let buttonTitle = "Buy"
    }
    let vpnItem: VPN
    let actionHandler: () -> ()
    var body: some View {
        VStack{
            HStack {
                ZStack{
                    Image(Constants.calendarImage)
                        .frame(width: 120, height: 120)
                    Text(String(vpnItem.days))
                        .padding(.top)
                        .font(.title)
                        .foregroundStyle(.black)
                }
                Text(vpnItem.title)
                    .frame(width: 179, height: 120)
                    .lineLimit(2)
                    .padding(.trailing, 59)
            }
            Spacer()
                .frame(height: 70)
            Button {
                actionHandler()
            } label: {
                Text(Constants.buttonTitle)
                    .padding()
                    .frame(width: 350)
                    .background(Color.blue)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}
