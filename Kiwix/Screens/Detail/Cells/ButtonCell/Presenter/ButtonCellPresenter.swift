//
//  ButtonCellPresenter.swift
//  Kiwix
//
//  Created by FFK on 12.06.2024.
//

import Foundation

protocol ButtonCellPresenterProtocol {
    func cancelButtonPressed()
    func nounButtonPressed()
    func verbButtonPressed()
    func adjectiveButtonPressed()
}

final class ButtonCellPresenter {
    
    var detailPresenter: DetailPresenterProtocol?
    
}

extension ButtonCellPresenter: ButtonCellPresenterProtocol {
    
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
