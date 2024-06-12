//
//  DetailPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol DetailPresenterProtocol {
    func viewDidLoad(_ synonym: String)
    func backButtonTapped()
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func definition(at indexPath: IndexPath) -> Definition?
    func sectionHeader(for section: Int) -> Meanings?
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
    
    func viewDidLoad(_ synonym: String) {
        view.displayWordDetailsHeader(word: word)
        view.registerView()
        interactor.fetchSynonym(for: synonym)
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
    
    func definition(at indexPath: IndexPath) -> Definition? {
        word.meanings?[indexPath.section].definitions?[indexPath.row]
    }
    
    func sectionHeader(for section: Int) -> Meanings? {
        word.meanings?[section]
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    
    func fetchSynonymOutput(result: SynonymResult) {
        switch result {
        case .success(let synonyms):
            DispatchQueue.main.sync {
                let topFiveSynonyms = synonyms.sorted(by: { synonym1, synonym2 in
                    return synonym1.score > synonym2.score
                }).prefix(5)
                self.view.displaySynonyms(Array(topFiveSynonyms))
            }
        case .failure(let error):
            print("Error fetching synonyms: \(error)")
        }
    }
}
