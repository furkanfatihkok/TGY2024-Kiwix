//
//  MockDetailViewController.swift
//  KiwixTests
//
//  Created by FFK on 14.06.2024.
//

import Foundation
@testable import Kiwix

class MockDetailView: DetailViewControllerProtocol {

    var displayedWordDetailsHeader = false
    var registeredView = false
    var headerViewSetup = false
    var footerViewSetup = false
    var footerViewVisibilityUpdated = false
    var displayedFilteredMeanings: [Meanings]? = nil
    var displayedSynonyms: [Kiwix.Synonym] = []
    
    func displayWordDetailsHeader(word: Word) {
        displayedWordDetailsHeader = true
    }
    
    func registerView() {
        registeredView = true
    }
    
    func setupHeaderView() {
        headerViewSetup = true
    }
    
    func setupFooterView() {
        footerViewSetup = true
    }
    
    func updateFooterViewVisibility(_ isVisible: Bool) {
        footerViewVisibilityUpdated = true
    }
    
    func displayFilteredMeanings(_ meanings: [Meanings]?) {
        displayedFilteredMeanings = meanings
    }
    
    func displaySynonyms(_ synonyms: [Kiwix.Synonym]) {
        displayedSynonyms = synonyms
    }

}
