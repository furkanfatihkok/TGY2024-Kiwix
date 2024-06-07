//
//  HomePresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol HomePresenterProtocol {
    func viewDidLoad()
    func leftButtonAction()
    func rightButtonAction()
    func searchButtonTapped(with word: String)
    func fetchSavedWords()
}

final class HomePresenter {

    unowned var view: HomeViewControllerProtocol!
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol
    
    private var words = [Word]()
    
    init(view: HomeViewControllerProtocol!, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func getSavedWords() -> [String] {
        return CoreDataManager.shared.fetchWords() ?? []
    }
    
}

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        if let viewController = view as? UIViewController {
            viewController.navigationController?.isNavigationBarHidden = true
        }
        view.setupTableView()
        fetchSavedWords()
    }
    
    func leftButtonAction() {
        view.resetToDefault()
    }
    
    func rightButtonAction() {
        view.setLeftButton()
        view.setRightButton()
        view.setSearchTextField()
        view.setRearLogo()
    }
    
    func searchButtonTapped(with word: String) {
        interactor.fetchWords(for: word)
    }
    
    func fetchSavedWords() {
        let savedWords = getSavedWords()
        view?.displaySavedWords(savedWords)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func fetchWordsOutput(result: WordResult) {
        switch result {
        case .success(let words):
            if words.isEmpty {
                DispatchQueue.main.async {
                    self.view.showNoResultView()
                }
            } else {
                DispatchQueue.main.async {
                    self.view.hideNoResultView()
                    CoreDataManager.shared.saveWord(word: words.first?.word ?? "")
                    self.fetchSavedWords()
                    self.router.navigate(to: .detail(words: words))
                }
            }
        case .failure(let error):
            DispatchQueue.main.async {
                self.view?.showNoResultView()
            }
        }
    }
    
}
