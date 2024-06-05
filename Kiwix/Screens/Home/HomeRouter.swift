//
//  HomeRouter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

enum HomeRoutes {
    case detail
}

protocol HomeRouterProtocol {
    
}

final class HomeRouter {
    
    weak var viewController: HomeViewController?
    
    static func createModule() -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        return view
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
