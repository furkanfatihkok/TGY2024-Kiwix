//
//  HomeRouter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

enum HomeRoutes {
    case detail(words: [Word])
}

protocol HomeRouterProtocol {
    func navigate(to route: HomeRoutes)
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
    func navigate(to route: HomeRoutes) {
        switch route {
        case .detail(let words):
            let detailVC = DetailViewController()
            detailVC.words = words
            viewController?.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
