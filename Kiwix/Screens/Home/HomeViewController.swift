//
//  HomeViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol HomeViewControllerProtocol: AnyObject {
    func setupTableView()
    func reloadData()
    func setLeftButton()
    func setRightButton()
    func setSearchTextField()
    func setRearLogo()
    func resetToDefault()
    func displaySavedWords(_ words: [String])
}

// TODO: searchbutton klavye üstüne çıkmasını sağla
// TODO: EmptyView'a bak
// TODO: detailTOhome yaptığımda default'a geri yüklensin.

final class HomeViewController: BaseViewController {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var rearLogo: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var noResultCell: NoResultCell!
    
    @IBOutlet weak var tableView: UITableView!
    
    var recentSearches: [String] = []
     
    var presenter: HomePresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        guard let searchText = searchTextField.text, !searchText.isEmpty else { return }
        presenter.searchButtonTapped(with: searchText)
    }
    
    @IBAction func leftButton(_ sender: UIButton) {
        presenter?.leftButtonAction()
    }
    
    @IBAction func rightButton(_ sender: UIButton) {
        presenter?.rightButtonAction()
    }
    
}

// MARK: - HomeView Protocol

extension HomeViewController: HomeViewControllerProtocol {

    func setupTableView() {
        tableView.register(UINib(nibName: RecentsCell.identifier, bundle: nil), forCellReuseIdentifier: RecentsCell.identifier)
        tableView.register(UINib(nibName: RecentHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: RecentHeader.identifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setLeftButton() {
        leftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
    }
    
    func setRightButton() {
        rightButton.setImage(UIImage(systemName: "xmark"), for: .normal)
    }
    
    func setSearchTextField() {
        searchTextField.isHidden = false
        searchTextField.text = ""
    }
    
    func setRearLogo() {
        rearLogo.isHidden = true
    }
    
    func resetToDefault() {
        leftButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        rightButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchTextField.isHidden = true
        searchTextField.text = ""
        rearLogo.isHidden = false
    }
    
    func displaySavedWords(_ words: [String]) {
        recentSearches = words
        reloadData()
    }
    
}

//MARK: - TableView Delegate & DataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(recentSearches.count,5)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentsCell.identifier, for: indexPath) as! RecentsCell
        cell.textLabel?.text = recentSearches[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RecentHeader.identifier) as! RecentHeader
        let count = min(recentSearches.count, 5)
        headerView.setNumberLabel("\(count)")
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWord = recentSearches[indexPath.row]
        presenter.wordSelected(selectedWord)
        
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.backgroundColor = .background
        selectedCell?.textLabel?.textColor = .white
    }
    
}

// MARK: - UITextField Delegate

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Klavyeyi kapat
        performSearch(textField.text) // Arama işlemini başlat
        return true
    }
    
    func performSearch(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else {
            // Aranan kelime boşsa veya nil ise işlem yapma
            return
        }
        presenter.searchButtonTapped(with: searchText)
    }
}
