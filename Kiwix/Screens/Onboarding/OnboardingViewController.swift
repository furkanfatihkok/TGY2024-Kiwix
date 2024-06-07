//
//  OnboardingViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol OnboardingViewControllerProtocol: AnyObject {
    
}

final class OnboardingViewController: BaseViewController, OnboardingViewControllerProtocol {
    
    var presenter: OnboardingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func getStartedButton(_ sender: UIButton) {
        presenter?.getStarted()
    }
}

