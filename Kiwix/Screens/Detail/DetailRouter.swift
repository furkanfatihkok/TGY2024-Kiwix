//
//  DetailRouter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol DetailRouterProtocol {
    func navigateToHomeVC()
}

final class DetailRouter {
    
    weak var viewController: DetailViewController?
    
    static func createModule(with word: Word) -> DetailViewController {
        let view = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: view, interactor: interactor, router: router, word: word)
        
        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view
        
        return view 
    }
}

extension DetailRouter: DetailRouterProtocol {
    
    func navigateToHomeVC() {
        guard let viewController = viewController else { return }
        viewController.navigationController?.popViewController(animated: true)
    }
    
}
