//
//  NoResultCellPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol NoResultCellPresenterProtocol {
    func loadDefault()
    func loadNoResult()
}

final class NoResultCellPresenter {
    
    weak var view: NoResultCellProtocol?
    
    init(view: NoResultCellProtocol) {
        self.view = view
    }
}

extension NoResultCellPresenter: NoResultCellPresenterProtocol {
    
    func loadDefault() {
        view?.setNoResult("Welcome to Kiwix")
        view?.setDescriptionLabel("Dictionary App")
    }
    
    func loadNoResult() {
        view?.setNoResult("No Result Found")
        view?.setDescriptionLabel("Try another search term.")
    }
    
}
