//
//  MockData.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import Foundation


struct MockData {
    static let shared = MockData()
    
    private let pizza: ListSection = {
        .pizza([
            .init(title: "", image: "Ассорти",  cost: 570, description: "Сыр моцарелла, майонез+пицца соус, ветчина, сервелат, копченая курица, грибы, орегано, чесночное масло"),
            .init(title: "", image: "Вегетарианская", cost: 540, description: "Сыр моцарелла, пицца-соус, брокколи, грибы, помидоры, болгарский перец, лук, маслины, орегано, чесночное"),
            .init(title: "", image: "Гавайская", cost: 540, description: "Сыр моцарелла, пицца-соус + майонез, курица копченая, ананас, орегано, чесночное масло, запечённая курица"),
            .init(title: "", image: "Морская", cost: 640, description: "Сыр моцарелла, сливочный соус, лосось, креветки, маслины, орегано, ароматное чесночное масло"),
            .init(title: "", image: "Мясная", cost: 570, description: "Сыр моцарелла, пицца-соус, ветчина, сервелат, копченая курица, помидоры, огурцы соленые, орегано, укроп, чесночное масло"),
            .init(title: "", image: "Острая", cost: 520, description: "Сыр моцарелла, пицца-соус, острый соус, сервелат, ветчина, помидоры, лук белый, орегано, чесночное масло"),
            .init(title: "", image: "Пепперони", cost: 540, description: "Сыр моцарелла, пепперони, пицца-соус, орегано, чесночное масло"),
            .init(title: "", image: "Ранчо", cost: 580, description: "Соус ранчо, запечённая курица, помидоры, лук красный, сервелат, огурцы соленые, орегано, чесночное масло"),
            .init(title: "", image: "Фирменная", cost: 590, description: "Сыр моцарелла, курица запеченная, говядина, помидоры, сливочный соус, орегано, чесночное масло"),
        ])
    }()
    
    private let drink: ListSection = {
        .drink([
            .init(title: "Смузи", image: "Клубнично-банановый смузи", cost: 120, description: "Смузи из клубники и банана – невероятно нежный на вкус. Это густой, кремовый освежающий фруктовый напиток"),
            .init(title: "Чай Ice", image: "Сладкий чай", cost: 80, description: "Сладкий чай"),
            .init(title: "Cola 0", image: "Coca-cola zero", cost: 80, description: "Газированный напиток без сахара"),
            .init(title: "Cola", image: "Coca-cola", cost: 120, description: "Газированный напиток"),
            .init(title: "Fanta", image: "Fanta", cost: 120, description: "Газированный напиток со вкусом апельсина"),
            .init(title: "Sprite", image: "Sprite", cost: 110, description: "Газированный напиток"),
            .init(title: "Смузи", image: "Смузи из манго и ананаса", cost: 110, description: "Смузи из манго и ананаса – невероятно нежный на вкус. Это густой, кремовый освежающий фруктовый напиток"),
            .init(title: "Лимонад", image: "Лимонад", cost: 120, description: "Газированный напиток"),
            .init(title: "Чай Hot", image: "Горячий чай", cost: 120, description: "Чай заварной"),
        ])
    }()
    
    private let sushi: ListSection = {
        .sushi([
            .init(title: "", image: "Ролл Греческий", cost: 180, description: "Рис, нори, сыр фета, помидор, перец болгарский, лист салата, огурец"),
            .init(title: "", image: "Ролл с крабом", cost: 300, description: "Крабовые палочки с майонезом, рис, нори, икра масаго оранжевая"),
            .init(title: "", image: "Ролл с лососем", cost: 300, description: "Рис, нори, сыр сливочный, лосось, огурец, тобико оранжевая"),
            .init(title: "", image: "Ролл с курицей", cost: 260, description: "Рис, нори, сыр сливочный, курица копчёная, огурец, сыр плавленный «Хохланд»"),
            .init(title: "", image: "Ролл с креветкой", cost: 260, description: "Рис, нори, сыр сливочный, авокадо, огурец, креветки"),
            .init(title: "", image: "Ролл с лососем", cost: 200, description: "Рис, нори, сыр сливочный, лосось"),
            .init(title: "", image: "Ролл с огурцом", cost: 150, description: "Рис, нори, сыр сливочный, огурец"),
            .init(title: "", image: "Ролл Сакура", cost: 170, description: "Рис, нори, сыр сливочный, тобико красная"),
        ])
    }()
    
    var pageData: [ListSection] {
        [pizza, drink, sushi]
    }
}
