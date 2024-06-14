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
    func displaySavedWords(_ words: [String])
    func setLeftButton()
    func setRightButton()
    func setSearchTextField()
    func setRearLogo()
    func resetToDefault()
    func setupHeaderView()
}

// TODO: EmptyView'a bak
// TODO: search button basınca textfiled açılsın.

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var rearLogo: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: HomePresenterProtocol!
    var noResultPresenter: EmptyViewPresenterProtocol?
    var recentSearches: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.height
        let buttonBottomY = searchButton.frame.origin.y / 2 + 90 + searchButton.frame.size.height
        
        if buttonBottomY > keyboardHeight {
            animateButtonAboveKeyboard(true, offset: buttonBottomY - keyboardHeight )
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        animateButtonAboveKeyboard(false, offset: 0)
    }
    
    private func animateButtonAboveKeyboard(_ above: Bool, offset: CGFloat) {
        let constant = above ? -offset : 0
        
        UIView.animate(withDuration: 0.3) {
            self.searchButton.transform = CGAffineTransform(translationX: 0, y: constant)
        }
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
        tableView.register(UINib(nibName: RecentSection.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: RecentSection.identifier)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displaySavedWords(_ words: [String]) {
        recentSearches = words
        reloadData()
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
    
    func setupHeaderView() {
        let headerView = EmptyView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        tableView.tableHeaderView = headerView
    }
    
}

// MARK: - TableView Delegate & DataSource

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
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: RecentSection.identifier) as! RecentSection
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
        textField.resignFirstResponder()
        performSearch(textField.text)
        return true
    }
    
    func performSearch(_ searchText: String?) {
        guard let searchText = searchText, !searchText.isEmpty else {
            return
        }
        presenter.searchButtonTapped(with: searchText)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.becomeFirstResponder()
    }
}
