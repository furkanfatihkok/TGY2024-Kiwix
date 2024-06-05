//
//  DetailViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    
}

final class DetailViewController: UIViewController {

    var presenter: DetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension DetailViewController: DetailViewControllerProtocol {
    
}
