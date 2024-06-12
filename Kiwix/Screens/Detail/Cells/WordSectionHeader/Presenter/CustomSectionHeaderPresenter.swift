//
//  SectionPresenter.swift
//  Kiwix
//
//  Created by FFK on 9.06.2024.
//

import Foundation

protocol CustomSectionHeaderPresenterProtocol {
    func load()
}

final class CustomSectionHeaderPresenter {
    
    weak var view: WordSectionHeader!
    
    init(view: WordSectionHeader) {
        self.view = view
    }
}

extension CustomSectionHeaderPresenter: CustomSectionHeaderPresenterProtocol {
    func load() {
        view.setNumberLabel("1")
        view.setPartOfSpeechLabel("noun")
    }
}
