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
    
    private var words: [Word]
    
    init(view: WordCellProtocol!, words: [Word]) {
        self.view = view
        self.words = words
    }
}

extension WordCellPresenter: WordCellPresenterProtocol {
    func load() {
        //TODO: dinamikleştir entity'e göre
        
        view.setDefinationLabel("organic structure composition.")
        view.setDefinationLabel("the organization of this painting is quite remarkable.")
    }
}
