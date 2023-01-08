//
//  ListSection.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import Foundation


enum ListSection {
    case pizza([ListItem])
    case sushi([ListItem])
    case drink([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .pizza(let items),
                .sushi(let items),
                .drink(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .pizza:
            return "Пицца"
        case .sushi:
            return "Роллы"
        case .drink:
            return "Напитки"
        }
    }
}
