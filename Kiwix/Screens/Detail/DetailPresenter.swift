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
    func cancelButtonPressed()
    func nounButtonPressed()
    func verbButtonPressed()
    func adjectiveButtonPressed()
    func displayAllMeanings()
}

final class DetailPresenter {
    
    weak var view: DetailViewControllerProtocol?
    let interactor: DetailInteractorProtocol
    let router: DetailRouterProtocol
    
    private var word: Word
    private var allMeanings: [Meanings]?
    
    init(view: DetailViewControllerProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol, word: Word) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.word = word
        self.allMeanings = word.meanings
    }
    
}

extension DetailPresenter: DetailPresenterProtocol {

    func viewDidLoad(_ synonym: String) {
        view?.displayWordDetailsHeader(word: word)
        view?.registerView()
        view?.setupHeaderView()
        view?.setupFooterView()
        interactor.fetchSynonym(for: synonym)
        displayAllMeanings()
    }
    
    func backButtonTapped() {
        router.navigateToHomeVC()
    }
    
    func numberOfSections() -> Int {
        allMeanings?.count ?? 0
    }
    
    func numberOfRows(in section: Int) -> Int {
        allMeanings?[section].definitions?.count ?? 0
    }
    
    func definition(at indexPath: IndexPath) -> Definition? {
        allMeanings?[indexPath.section].definitions?[indexPath.row]
    }
    
    func sectionHeader(for section: Int) -> Meanings? {
        allMeanings?[section]
    }
    
    func cancelButtonPressed() {
        view?.displayFilteredMeanings(allMeanings)
    }
    
    func nounButtonPressed() {
        let filteredMeanings = allMeanings?.filter { $0.partOfSpeech == "noun" }
        view?.displayFilteredMeanings(filteredMeanings)
    }
    
    func verbButtonPressed() {
        let filteredMeanings = allMeanings?.filter { $0.partOfSpeech == "verb" }
        view?.displayFilteredMeanings(filteredMeanings)
    }
    
    func adjectiveButtonPressed() {
        let filteredMeanings = allMeanings?.filter { $0.partOfSpeech == "adjective" }
        view?.displayFilteredMeanings(filteredMeanings)
    }
    
    func displayAllMeanings() {
        view?.displayFilteredMeanings(allMeanings)
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
                self.view?.displaySynonyms(Array(topFiveSynonyms))
            }
        case .failure(let error):
            print("Error fetching synonyms: \(error)")
        }
    }
}
