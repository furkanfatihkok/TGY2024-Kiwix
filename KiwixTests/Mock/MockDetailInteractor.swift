//
//  MockDetailInteractor.swift
//  KiwixTests
//
//  Created by FFK on 14.06.2024.
//

import Foundation
@testable import Kiwix

class MockDetailInteractor: DetailInteractorProtocol {
    
    var synonymFetched = false
    
    func fetchSynonym(for synonym: String) {
        synonymFetched = true
    }
    
}
