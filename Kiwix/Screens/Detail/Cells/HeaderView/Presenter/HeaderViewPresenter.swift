//
//  HeaderViewPresenter.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit

protocol HeaderViewPresenterProtocol {
    func audioButtonTapped()
}

final class HeaderViewPresenter {
    
    weak var view: HeaderViewProtocol?
    
    private var isNounButtonTapped = false
    private var isVerbButtonTapped = false
    
    init(view: HeaderViewProtocol) {
        self.view = view
    }
}

extension HeaderViewPresenter: HeaderViewPresenterProtocol {
    //TODO: Buttonlar tam işlevsel çalışmıyor buna bak
    func audioButtonTapped() {
        //TODO: Audio çalma işlemleri burada yapılacak
        view?.setVoiceButton(UIImage(systemName: "speaker.fill")!)
    }
}
