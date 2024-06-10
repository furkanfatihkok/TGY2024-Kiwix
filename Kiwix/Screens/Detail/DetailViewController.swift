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
}

//TODO: wordCell labelım dğzenle 
//TODO: headerView PHOTETİC boş gelme durumda hidden yap.

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: DetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        presenter?.backButtonTapped()
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
        tableView.register(UINib(nibName: CustomSectionHeader.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CustomSectionHeader.identifier)
        collectionView.register(UINib(nibName: ButtonCell.identifier, bundle: nil), forCellWithReuseIdentifier: ButtonCell.identifier)
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
            print("Definition at \(indexPath): \(definition)")
            let presenter = WordCellPresenter(view: cell, definition: definition)
            cell.configure(with: presenter)
        } else {
            print("Definition not found at \(indexPath)")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomSectionHeader.identifier) as! CustomSectionHeader
        if let meaning = presenter?.sectionHeader(for: section) {
            headerView.setNumberLabel("\(section + 1)")
            headerView.setPartOfSpeechLabel(meaning.partOfSpeech ?? "")
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDataSource

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
}
