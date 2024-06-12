//
//  DetailInteractor.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

typealias SynonymResult = Result<[Synonym],APIError>

protocol DetailInteractorProtocol {
    func fetchSynonym(for word: String)
}

protocol DetailInteractorOutputProtocol {
    func fetchSynonymOutput(result: SynonymResult)
}

final class DetailInteractor {
     var output: DetailInteractorOutputProtocol?
}

extension DetailInteractor: DetailInteractorProtocol {
    
    func fetchSynonym(for word: String) {
        NetworkManager.shared.fetchSynonym(for: word) { [weak self] result in
            guard let self else { return }
            self.output?.fetchSynonymOutput(result: result)
        }
    }

}

