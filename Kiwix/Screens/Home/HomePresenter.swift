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
    func wordSelected(_ word: String)
}

final class HomePresenter {
    
    weak var view: HomeViewControllerProtocol?
    let interactor: HomeInteractorProtocol
    let router: HomeRouterProtocol

    private var words = [Word]()
    
    init(view: HomeViewControllerProtocol, interactor: HomeInteractorProtocol, router: HomeRouterProtocol) {
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
        view?.setupTableView()
        view?.setupHeaderView()
        fetchSavedWords()
    }
    
    func leftButtonAction() {
        view?.resetToDefault()
    }
    
    func rightButtonAction() {
        view?.setLeftButton()
        view?.setRightButton()
        view?.setSearchTextField()
        view?.setRearLogo()
    }
    
    func searchButtonTapped(with word: String) {
        interactor.fetchWords(for: word)
        view?.setSearchTextField()
    }
    
    func fetchSavedWords() {
        let savedWords = getSavedWords()
        view?.displaySavedWords(savedWords)
    }
    
    func wordSelected(_ word: String) {
        interactor.fetchWords(for: word)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    func fetchWordsOutput(result: WordResult) {
        switch result {
        case .success(let words):
            if words.isEmpty {
                
            } else {
                DispatchQueue.main.async {
                    CoreDataManager.shared.saveWord(word: words.first?.word ?? "")
                    self.fetchSavedWords()
                    if let firstWord = words.first {
                        self.router.navigate(to: .detail(word: firstWord))
                    }
                }
            }
        case .failure( _): break
            
        }
    }
}
