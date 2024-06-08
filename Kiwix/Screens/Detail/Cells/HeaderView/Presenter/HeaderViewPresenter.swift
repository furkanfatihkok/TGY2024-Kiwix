//
//  HeaderViewPresenter.swift
//  Kiwix
//
//  Created by FFK on 8.06.2024.
//

import UIKit

protocol HeaderViewPresenterProtocol {
    func audioButtonTapped()
    func xmarkButtonTapped()
    func nounButtonTapped()
    func verbButtonTapped()
    func adjectiveButtonTapped()
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
    
    func xmarkButtonTapped() {
        view?.setXmarkButton(isHidden: true)
        isNounButtonTapped = false
        isVerbButtonTapped = false
        view?.setNounButton(title: "Noun", borderColor: .clear)
        view?.setVerbButton(isHidden: false, borderColor: .clear)
        view?.setAdjectiveButton(isHidden: false, borderColor: .clear)
    }
    
    func nounButtonTapped() {
        isNounButtonTapped = true
        view?.setXmarkButton(isHidden: false)
        view?.setNounButton(title: "Noun", borderColor: .background)
    }
    
    func verbButtonTapped() {
        if !isNounButtonTapped {
            view?.setXmarkButton(isHidden: false)
            view?.setVerbButton(isHidden: false, borderColor: .background)
        } else {
            isVerbButtonTapped = true
            view?.setNounButton(title: "Noun, Verb", borderColor: .background)
            view?.setVerbButton(isHidden: true, borderColor: .clear)
        }
    }
    
    func adjectiveButtonTapped() {
        if !isNounButtonTapped || !isVerbButtonTapped {
            view?.setXmarkButton(isHidden: false)
            view?.setVerbButton(isHidden: false, borderColor: .black)
        } else {
            view?.setNounButton(title: "Noun, Verb, Adjective", borderColor: .black)
            view?.setAdjectiveButton(isHidden: true, borderColor: .clear)
        }
    }
    
}
