//
//  VPNView.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 05.05.2024.
//

import Foundation
import SwiftUI

struct VPNView: View {
    
    private enum Constants {
        static let imageFlag = "flag"
        static let serviceText = "Service will expire after 15 days."
        static let adressText = "IP Address"
        static let adressNumbers = "127.0.0.1"
        static let receivedText = "Received"
        static let mbText = "0 MB"
        static let sentText = "Sent"
    }
    
    @State private var isToggle = false
    
    var body: some View {
        VStack{
            Spacer()
            ZStack {
                if isToggle {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 200, height: 200)
                }
                Image(Constants.imageFlag)
                    .frame(width: 150, height: 150)
            }
            .frame(height: 200)
            
            Spacer()
            HStack {
                Toggle(isOn: $isToggle, label: {})
                    .frame(width: 1)
            }
            statistic
            Spacer()
            Text(Constants.serviceText)
            Spacer()
                .frame(height: 20)
        }
    }
    
    private var statistic: some View {
        VStack(spacing: 1){
            addTextInformation(title: Constants.adressText, text: Constants.adressNumbers)
            addTextInformation(title: Constants.receivedText, text: Constants.mbText)
            addTextInformation(title: Constants.sentText, text: Constants.mbText)
        }
    }
    
    private func addTextInformation(title: String, text: String) -> some View {
        HStack{
            Text(title)
                .frame(width: 100, alignment: .leading)
            Spacer()
                .frame(width: 100)
            Text(text)
                .frame(width: 100, alignment: .trailing)
        }.padding()
    }
}
