//
//  MockDetailRouter.swift
//  KiwixTests
//
//  Created by FFK on 14.06.2024.
//

import Foundation
@testable import Kiwix

class MockDetailRouter: DetailRouterProtocol {
    
    var navigatedToHomeVC = false
    
    func navigateToHomeVC() {
        navigatedToHomeVC = true
    }
    
}
