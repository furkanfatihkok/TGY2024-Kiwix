//
//  HomeInteractor.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

typealias WordResult = Result<[Word],APIError>

protocol HomeInteractorProtocol {
    func fetchWords(for word: String)
}

protocol HomeInteractorOutputProtocol {
    func fetchWordsOutput(result: WordResult)
}

final class HomeInteractor {
    var output: HomeInteractorOutputProtocol?
}

extension HomeInteractor: HomeInteractorProtocol {
    
    func fetchWords(for word: String) {
        NetworkManager.shared.fetchWord(for: word) { [weak self] result in
            guard let self else { return }
            self.output?.fetchWordsOutput(result: result)
        }
    }
    
}
