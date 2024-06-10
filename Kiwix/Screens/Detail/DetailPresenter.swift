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
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func sectionHeader(for section: Int) -> Meanings?
    func definition(at indexPath: IndexPath) -> Definition?
}

final class DetailPresenter {
    
    weak var view: DetailViewControllerProtocol!
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
    
    func numberOfSections() -> Int {
        word.meanings?.count ?? 0
    }
    
    func numberOfRows(in section: Int) -> Int {
        word.meanings?[section].definitions?.count ?? 0
    }
    
    func sectionHeader(for section: Int) -> Meanings? {
        word.meanings?[section]
    }
    
    func definition(at indexPath: IndexPath) -> Definition? {
        word.meanings?[indexPath.section].definitions?[indexPath.row]
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
}
