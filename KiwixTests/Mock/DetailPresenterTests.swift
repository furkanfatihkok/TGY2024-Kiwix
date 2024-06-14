//
//  DetailPresenterTests.swift
//  KiwixTests
//
//  Created by FFK on 14.06.2024.
//

import XCTest
@testable import Kiwix

class DetailPresenterTests: XCTestCase {
    
    var presenter: DetailPresenter!
    var mockView: MockDetailView!
    var mockInteractor: MockDetailInteractor!
    var mockRouter: MockDetailRouter!
    var testWord: Word!
    
    override func setUp() {
        super.setUp()
        mockView = MockDetailView()
        mockInteractor = MockDetailInteractor()
        mockRouter = MockDetailRouter()
        testWord = Word(word: "test", phonetics: nil, meanings: nil)
        presenter = DetailPresenter(view: mockView, interactor: mockInteractor, router: mockRouter, word: testWord)
    }
    
    func testViewDidLoad() {
        presenter.viewDidLoad("synonym")
        
        XCTAssertTrue(mockView.displayedWordDetailsHeader, "Should have called displayWordDetailsHeader")
        XCTAssertTrue(mockView.registeredView, "Should have called registerView")
        XCTAssertTrue(mockView.headerViewSetup, "Should have called setupHeaderView")
        XCTAssertTrue(mockView.footerViewSetup, "Should have called setupFooterView")
        XCTAssertTrue(mockInteractor.synonymFetched, "Should have called fetchSynonym")
    }
    
    func testBackButtonTapped() {
        presenter.backButtonTapped()
        
        XCTAssertTrue(mockRouter.navigatedToHomeVC, "Should have navigated to home VC")
    }
    
    override func tearDown() {
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        presenter = nil
        testWord = nil
        super.tearDown()
    }
}

