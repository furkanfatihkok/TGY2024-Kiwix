//
//  NoResultCellPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol NoResultCellPresenterProtocol {
    func load()
}

final class NoResultCellPresenter {
    
    weak var view: NoResultCellProtocol?
    
    init(view: NoResultCellProtocol) {
        self.view = view
    }
}

extension NoResultCellPresenter: NoResultCellPresenterProtocol {
    
    func load() {
        view?.setNoResult("No Result Found")
        view?.setDescriptionLabel("Discover other words")
    }
    
}
