//
//  WordCellPresenter.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import Foundation

protocol WordCellPresenterProtocol {
    func load()
}

final class WordCellPresenter {
    
    weak var view: WordCellProtocol!
    
    private var definition: Definition
    
    init(view: WordCellProtocol, definition: Definition) {
        self.view = view
        self.definition = definition
    }
}

extension WordCellPresenter: WordCellPresenterProtocol {
    func load() {
        view?.setDefinationLabel(definition.definition ?? "")
        
        if let example = definition.example, !example.isEmpty {
            view?.setExampleLabel(example)
            view?.showExampleStackView(true)
        } else {
            view?.setExampleLabel("")
            view?.showExampleStackView(false)
        }
    }
}
