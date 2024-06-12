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
    
    weak var view: ButtonCellProtocol!
    
    init(view: ButtonCellProtocol) {
        self.view = view
    }
}

extension ButtonCellPresenter: ButtonCellPresenterProtocol {
    
    func cancelButtonPressed() {
        print("cancel")
    }
    
    func nounButtonPressed() {
        print("noun")
    }
    
    func verbButtonPressed() {
        print("verb")
    }
    
    func adjectiveButtonPressed() {
        print("adjective")
    }
    
}
