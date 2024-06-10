//
//  DetailPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol DetailPresenterProtocol {
    func viewDidLoad()
    func backButtonTapped()
}

final class DetailPresenter {
    
    unowned var view: DetailViewControllerProtocol!
    let interactor: DetailInteractorProtocol
    let router: DetailRouterProtocol
    
    private var word: Word
    
    init(view: DetailViewControllerProtocol!, interactor: DetailInteractorProtocol, router: DetailRouterProtocol, word: Word) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.word = word
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func viewDidLoad() {
        view.displayWordDetailsHeader(word: word)
        view.registerView()
    }
    
    func backButtonTapped() {
        router.navigateToHomeVC()
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
}
