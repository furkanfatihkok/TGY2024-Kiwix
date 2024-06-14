//
//  DetailViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func registerView()
    func displayWordDetailsHeader(word: Word)
    func displaySynonyms(_ synonyms: [Synonym])
    func displayFilteredMeanings(_ meanings: [Meanings]?)
    func setupHeaderView()
    func setupFooterView()
    func updateFooterViewVisibility(_ isVisible: Bool)
}

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DetailPresenterProtocol?
    var word: String?
    var phonetics: [Phonetics]?
    var filteredMeanings: [Meanings]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(word ?? "")
        setupHeaderPresenter()
    }
    
    private func setupHeaderPresenter() {
        if let phonetics = phonetics?.first {
            let headerViewPresenter = HeaderViewPresenter(view: headerView, phonetics: phonetics)
            headerView.headerPresenter = headerViewPresenter
        }
    }
    @IBAction func backButton(_ sender: UIButton) {
        presenter?.backButtonTapped()
    }
    
}

// MARK: - DetailViewProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
    func registerView() {
        tableView.register(UINib(nibName: WordCell.identifier, bundle: nil), forCellReuseIdentifier: WordCell.identifier)
        tableView.register(UINib(nibName: WordSectionHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: WordSectionHeader.identifier)
    }
    
    func displayWordDetailsHeader(word: Word) {
        headerView.setWordLabel(word.word ?? "")
        
        if let phonetic = word.phonetics?.first?.text {
            headerView.setPhonteticLabel("[ \(phonetic) ]")
        }
    }
    
    func displaySynonyms(_ synonyms: [Synonym]) {
        guard let footerView = tableView.tableFooterView as? FooterView else { return }
        
        let synonymLabels = [footerView.synonymOne, footerView.synonymTwo, footerView.synonymThree, footerView.synonymFour, footerView.synonymFive]
        
        if synonyms.isEmpty {
            updateFooterViewVisibility(false)
        } else {
            updateFooterViewVisibility(true)
            for (index, synonym) in synonyms.prefix(5).enumerated() {
                synonymLabels[index]?.text = synonym.word
            }
        }
    }
    
    func displayFilteredMeanings(_ meanings: [Meanings]?) {
        filteredMeanings = meanings
        tableView.reloadData()
    }
    
    func setupHeaderView() {
        let headerView = ButtonView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        
        let buttonCellPresenter = ButtonViewPresenter()
        buttonCellPresenter.detailPresenter = presenter
        headerView.presenter = buttonCellPresenter
        
        tableView.tableHeaderView = headerView
    }
    
    func setupFooterView() {
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        tableView.tableFooterView = footerView
    }
    
    func updateFooterViewVisibility(_ isVisible: Bool) {
        tableView.tableFooterView?.isHidden = !isVisible
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSoure

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredMeanings?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredMeanings?[section].definitions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.identifier, for: indexPath) as! WordCell
        
        if let definition = filteredMeanings?[indexPath.section].definitions?[indexPath.row] {
            let presenter = WordCellPresenter(view: cell, definition: definition)
            cell.configure(with: presenter)
        } else {
            print("Definition not found at \(indexPath)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WordSectionHeader.identifier) as! WordSectionHeader
        if let meaning = filteredMeanings?[section] {
            headerView.setNumberLabel("\(section + 1)")
            headerView.setPartOfSpeechLabel(meaning.partOfSpeech ?? "")
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        110
    }
    
}
