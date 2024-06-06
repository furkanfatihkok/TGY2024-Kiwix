//
//  OnboardingRouter.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

enum OnboardingRoutes {
    case home
}

protocol OnboardingRouterProtocol {
    func navigate(_ routes: OnboardingRoutes)
}

final class OnboardingRouter {
    
    weak var viewController: OnboardingViewController?
    
    static func createModule() -> OnboardingViewController {
        let view = OnboardingViewController()
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(view: view, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}

extension OnboardingRouter: OnboardingRouterProtocol {
    func navigate(_ routes: OnboardingRoutes) {
        switch routes {
        case .home:
            guard let window = viewController?.view.window else { return }
            
            let homeVC = HomeRouter.createModule()
            let navigationController = UINavigationController(rootViewController: homeVC)
            window.rootViewController = navigationController
        }
    }
    
}
