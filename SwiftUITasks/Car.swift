//
//  Car.swift
//  SwiftUITasks
//
//  Created by Руслан Абрамов on 05.05.2024.
//

import Foundation

struct AutoModel: Hashable {
    let id = UUID()
    let model: String
    let price: Int
    let carImage: String
}
