//
//  RickAndMortyiOSUITests.swift
//  RickAndMortyiOSUITests
//
//  Created by Alperen Ünal on 31.10.2020.
//

import XCTest

class RickAndMortyiOSUITests: XCTestCase {

    let app = XCUIApplication()
    let charactersPage = CharactersPage(XCUIApplication())
    
    override func setUpWithError() throws {
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testSearch() throws {
        charactersPage
            .search(keyword: " ").clearSearchField()
            .search(keyword: "=/*").clearSearchField()
            .search(keyword: "Jerry").clearSearchField()
            .cancelSearch()
            .navigateToLocationsPage()
            .search(keyword: " ").clearSearchField()
            .search(keyword: "=/*").clearSearchField()
            .search(keyword: "Anatomy").clearSearchField()
            .cancelSearch()
            .navigateToEpisodesPage()
            .search(keyword: " ").clearSearchField()
            .search(keyword: "=/*").clearSearchField()
            .search(keyword: "The Wedding").clearSearchField()
    }
    
    func testNavigateToDetailpage() throws {
        charactersPage
            .enterFirstCard()
    }
    
    func testNavigateToMainPage() throws {
        charactersPage
            .navigateToLocationsPage()
            .navigateToEpisodesPage()
            .navigateToCharactersPage()
            .enterFirstCard()
            .navigateToCharactersPage()
    }

}
