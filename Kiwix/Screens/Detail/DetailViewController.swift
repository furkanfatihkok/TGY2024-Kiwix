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
    
    @IBOutlet weak var headetView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    var words = [Word]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(words)
        
        tableView.register(UINib(nibName: WordCell.identifier, bundle: nil), forCellReuseIdentifier: WordCell.identifier)
        tableView.register(UINib(nibName: CustomSection.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CustomSection.identifier)
    }

}

//MARK: - DetailViewProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
}

//MARK: - UITableViewDelegate & UITableViewDataSoure

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.identifier, for: indexPath) as! WordCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomSection.identifier) as! CustomSection
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
