//
//  AsselderBuilder.swift
//  Delivery
//
//  Created by Nikolai Maksimov on 08.01.2023.
//

import UIKit

protocol AsselderBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(item: ListItem?, router: RouterProtocol) -> UIViewController
}

class AsselderBuilder: AsselderBuilderProtocol {
    
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let data = MockData.shared.pageData
        let presenter = MainViewPresenter(view: view, data: data, router: router)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(item: ListItem?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailViewPresenter(view: view, router: router, item: item)
        view.presenter = presenter
        return view
    }
}
