//
//  DetailViewPresenter.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import Foundation


protocol DetailViewProtocol: AnyObject {
    func setItem(item: ListItem?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, router: RouterProtocol, item: ListItem?)
    func setItem()
    func popToRoot()
}

class DetailViewPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let router: RouterProtocol
    let item: ListItem?
    
    required init(view: DetailViewProtocol, router: RouterProtocol, item: ListItem?) {
        self.view = view
        self.router = router
        self.item = item
    }
    
    func popToRoot() {
        router.popToRoot()
    }
    
    public func setItem() {
        view?.setItem(item: item)
    }
}
