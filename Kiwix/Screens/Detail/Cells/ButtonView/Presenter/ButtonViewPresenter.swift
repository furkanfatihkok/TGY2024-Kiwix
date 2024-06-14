//
//  ButtonCellPresenter.swift
//  Kiwix
//
//  Created by FFK on 12.06.2024.
//

import Foundation

protocol ButtonViewPresenterProtocol {
    func cancelButtonPressed()
    func nounButtonPressed()
    func verbButtonPressed()
    func adjectiveButtonPressed()
}

final class ButtonViewPresenter {
    
    var detailPresenter: DetailPresenterProtocol?
    
}

extension ButtonViewPresenter: ButtonViewPresenterProtocol {
    
    func cancelButtonPressed() {
        detailPresenter?.cancelButtonPressed()
    }
    
    func nounButtonPressed() {
        detailPresenter?.nounButtonPressed()
    }
    
    func verbButtonPressed() {
        detailPresenter?.verbButtonPressed()
    }
    
    func adjectiveButtonPressed() {
        detailPresenter?.adjectiveButtonPressed()
    }
    
}
