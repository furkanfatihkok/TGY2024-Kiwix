//
//  CustomSectionPresenter.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import Foundation

protocol CustomSectionPresenterProtocol {
    func loadSection()
}

final class CustomSectionPresenter {
    
    weak var view: CustomSectionProtocol?
    
    init(view: CustomSectionProtocol) {
        self.view = view
    }
}

extension CustomSectionPresenter: CustomSectionPresenterProtocol {
    
    func loadSection() {
        view?.setSectionTitle("noun")
        view?.setNumberOfSection("1")
    }
    
}
