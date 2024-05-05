//
//  VPNViewModel.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 05.05.2024.
//

import Foundation

final class VPNViewModel: ObservableObject {
    public var cases: [VPN] = [.init(days: 7, title: "Vacation (7 days) 99 RUB"),
                                  .init(days: 30, title: "Standart (1 month) 179 RUB"),
                                  .init(days: 90, title: "Standart+ (3 month) 279 RUB")]
    @Published var selectedItems: VPN?
    
    func selectedItem(selectedItems: VPN) {
        self.selectedItems = selectedItems
    }
    
    func deleteItem() {
        self.selectedItems = nil
    }
}
