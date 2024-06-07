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
    
    var words: [Word] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(words)
    }

}

extension DetailViewController: DetailViewControllerProtocol {
    
}
