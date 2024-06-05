//
//  HomeViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    
}

final class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension HomeViewController: HomeViewControllerProtocol {
    
}
