//
//  OnboardingPresenter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import Foundation

protocol OnboardingPresenterProtocol {
    func getStarted()
}

final class OnboardingPresenter {
    
    weak var view: OnboardingViewControllerProtocol?
    let router: OnboardingRouter?
    
    init(view: OnboardingViewControllerProtocol, router: OnboardingRouter?) {
        self.view = view
        self.router = router
    }
}

extension OnboardingPresenter: OnboardingPresenterProtocol {
    func getStarted() {
        router?.navigate(.home)
    }
}
