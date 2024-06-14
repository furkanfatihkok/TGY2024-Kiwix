//
//  NoResultPresenter.swift
//  Kiwix
//
//  Created by FFK on 14.06.2024.
//

import Foundation

protocol EmptyViewPresenterProtocol {
    func emptyView()
}

final class EmptyViewPresenter {
    
    weak var presenter: EmptyViewProtocol?
    
    init(presenter: EmptyViewProtocol?) {
        self.presenter = presenter
    }
}

extension EmptyViewPresenter: EmptyViewPresenterProtocol {
    
    func emptyView() {
        presenter?.setDescriptionLabel("Search any word")
        presenter?.setNoResult("blablalbla")
    }
    
}
