//
//  HomePresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol HomePresenterProtocol {
    
}

final class HomePresenter {
    
    private weak var view: HomeViewControllerProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouterProtocol
    
    init(view: HomeViewControllerProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
}
