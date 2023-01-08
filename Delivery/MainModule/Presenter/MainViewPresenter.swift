//
//  MainViewPresenter.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import Foundation


protocol MainViewProtocol: AnyObject {
    func reloadData()
}

protocol MainViewPresenterProtocol: AnyObject {
    
    init(view: MainViewProtocol, data: [ListSection], router: RouterProtocol)
    var listItems: [ListSection]! { get set }
    func getItems()
    func tapOnTheItem(item: ListItem?)
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    var listItems: [ListSection]!
    weak var view: MainViewProtocol?
    let router: RouterProtocol?
    
    required init(view: MainViewProtocol, data: [ListSection], router: RouterProtocol) {
        self.view = view
        self.listItems = data
        self.router = router
    }
    
    func tapOnTheItem(item: ListItem?) {
        router?.showDetail(item: item)
    }
    
    func getItems() {
        listItems = MockData.shared.pageData
    }
}
