//
//  DetailPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol DetailPresenterProtocol {
    
}

final class DetailPresenter {
    
    private weak var view: DetailViewControllerProtocol?
    private let interactor: HomeInteractorProtocol
    private let router: HomeRouter
    
    init(view: DetailViewControllerProtocol, interactor: HomeInteractorProtocol, router: HomeRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
}
