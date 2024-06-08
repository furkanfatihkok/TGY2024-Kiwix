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
    
    @IBOutlet weak var headerView: HeaderView!
    
    var words: [Word] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(words)
        let presenter = HeaderViewPresenter(view: headerView)
        headerView.presenter = presenter
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    
}
