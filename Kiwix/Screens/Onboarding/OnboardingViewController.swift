//
//  OnboardingViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol OnboardingViewControllerProtocol: AnyObject {
    
}

final class OnboardingViewController: UIViewController, OnboardingViewControllerProtocol {
    
    var presenter: OnboardingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getStartedButton(_ sender: UIButton) {
        presenter?.getStarted()
    }
}

