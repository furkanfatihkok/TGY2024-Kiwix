//
//  DetailViewController.swift
//  Kiwix
//
//  Created by FFK on 6.06.2024.
//

import UIKit

protocol DetailViewControllerProtocol: AnyObject {
    func displayWordDetailsHeader(word: Word)
    func registerView()
    func displaySynonyms(_ synonyms: [Synonym])
}

//TODO: celler arası boşluğu dinamikleştir.

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: DetailPresenterProtocol?
    var word: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(word ?? "")
        setupHeaderView()
        setupFooterView()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        presenter?.backButtonTapped()
    }
    
    private func setupHeaderView() {
        let buttonView = ButtonCell(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        tableView.tableHeaderView = buttonView
    }
    
    private func setupFooterView() {
        let footerView = FooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        tableView.tableFooterView = footerView
    }

}

//MARK: - DetailViewProtocol

extension DetailViewController: DetailViewControllerProtocol {
    
    func displayWordDetailsHeader(word: Word) {
        headerView.setWordLabel(word.word ?? "")
        
        if let phonetic = word.phonetics?.first?.text {
            headerView.setPhonteticLabel("[ \(phonetic) ]")
        }
    }
    
    func registerView() {
        tableView.register(UINib(nibName: WordCell.identifier, bundle: nil), forCellReuseIdentifier: WordCell.identifier)
        tableView.register(UINib(nibName: WordSectionHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: WordSectionHeader.identifier)
    }
    
    func displaySynonyms(_ synonyms: [Synonym]) {
        guard let footerView = tableView.tableFooterView as? FooterView else { return }
        
        let synonymLabels = [footerView.synonymOne, footerView.synonymTwo, footerView.synonymThree, footerView.synonymFour, footerView.synonymFive]
        for (index, synonym) in synonyms.prefix(5).enumerated() {
            synonymLabels[index]?.text = synonym.word
        }
    }
}

//MARK: - UITableViewDelegate & UITableViewDataSoure

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WordCell.identifier, for: indexPath) as! WordCell
        
        if let definition = presenter?.definition(at: indexPath) {
            let presenter = WordCellPresenter(view: cell, definition: definition)
            cell.configure(with: presenter)
        } else {
            print("Definition not found at \(indexPath)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: WordSectionHeader.identifier) as! WordSectionHeader
        if let meaning = presenter?.sectionHeader(for: section) {
            headerView.setNumberLabel("\(section + 1)")
            headerView.setPartOfSpeechLabel(meaning.partOfSpeech ?? "")
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    //    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 120 // Tahmini yükseklik
    //    }
}
