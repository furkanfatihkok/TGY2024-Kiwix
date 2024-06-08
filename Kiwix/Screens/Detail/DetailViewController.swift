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
    @IBOutlet weak var tableView: UITableView!
    
    var words = [Word]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(words)
        let presenter = HeaderViewPresenter(view: headerView)
        headerView.presenter = presenter
    }
}

//MARK: - DetailViewProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
}

//MARK: - UITableViewDelegate & UITableViewDataSoure

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
