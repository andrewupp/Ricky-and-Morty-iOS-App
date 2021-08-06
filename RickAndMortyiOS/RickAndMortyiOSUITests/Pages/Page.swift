//
//  Page.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation
import XCTest

let timeoutForSearchResults: TimeInterval = 3.0

protocol Page: Operable {
    var app: XCUIApplication { get }
    var navigationBar: XCUIElement { get }
    var searchField: XCUIElement { get }
    var clearTextButton: XCUIElement { get }
    var titleStaticText: XCUIElement { get }
    var cancelButton: XCUIElement { get }
    
    @discardableResult func search(keyword: String) -> Self
    @discardableResult func clearSearchField() -> Self
    @discardableResult func validateSearchResults(_ keyword: String) -> Self
    
    
    init(_ app: XCUIApplication)
}

//MARK: Search Functions
extension Page {
    @discardableResult
    func search(keyword: String) -> Self {
        if !(keyword.isEmpty) {
            tapElement(element: searchField)
            searchField.typeText(keyword)
            tapReturnKeyOnKeyBoard(button: .search)
            validateSearchResults(keyword)
        } else {
            fatalError(ErrorHelper.keywordIsInvalid)
        }
        return self
    }
    
    @discardableResult
    func clearSearchField() -> Self {
        tapElement(element: clearTextButton)
        return self
    }
    
    @discardableResult
    func cancelSearch() -> Self {
        tapElement(element: cancelButton)
        return self
    }
}

//MARK: Tab Bar Functions
extension Page {
    @discardableResult
    func navigateToCharactersPage() -> CharactersPage {
        navigateTo(tab: .CharactersTab)
        return CharactersPage(app)
    }
    
    @discardableResult
    func navigateToLocationsPage() -> LocationsPage {
        navigateTo(tab: .LocationsTab)
        return LocationsPage(app)
    }
    
    @discardableResult
    func navigateToEpisodesPage() -> EpisodesPage {
        navigateTo(tab: .EpisodesTab)
        return EpisodesPage(app)
    }
    
    private func navigateTo(tab: TabBar) {
        tapElement(element: tab.element)
        XCTAssertTrue(tab.element.isSelected)
    }
}
