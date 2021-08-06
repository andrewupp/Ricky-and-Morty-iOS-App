//
//  CharactersPage.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation
import XCTest

class CharactersPage: Page {    
    
    let app: XCUIApplication
    let navigationBar: XCUIElement
    let searchField: XCUIElement
    let clearTextButton: XCUIElement
    let titleStaticText: XCUIElement
    let cancelButton: XCUIElement
    let filterViewButton: XCUIElement
    
    required init(_ app: XCUIApplication) {
        self.app = app
        self.navigationBar = NavigaitonBar.NavigationBar.element
        self.searchField = NavigaitonBar.SearchField.element
        self.clearTextButton = NavigaitonBar.SearchField.clearButton
        self.titleStaticText = NavigaitonBar.TitleStaticText.element
        self.cancelButton = NavigaitonBar.CancelButton.element
        self.filterViewButton = NavigaitonBar.FilterViewButton.element
    }
    
    @discardableResult
    func validateSearchResults(_ keyword: String) -> Self {
        let firstElement: XCUIElement = app.descendants(matching: .collectionView).cells.element(boundBy: 0)
        
        if (Contents.notFoundStaticText.element.waitForExistence(timeout: timeoutForSearchResults)) {
            print(Contents.notFoundStaticText.element.label)
        } else {
            XCTAssertTrue(firstElement.exists)
            if !(keyword.isEmptyOrWhitespace()) {
                XCTAssertTrue(firstElement.children(matching: .staticText).element(boundBy: 0).label.contains(keyword))
            }
        }
        return self
    }
    
    @discardableResult
    func enterFirstCard() -> Self {
        let firstElement: XCUIElement = app.descendants(matching: .collectionView).cells.element(boundBy: 0)
        let cardName: String = firstElement.children(matching: .staticText).element(boundBy: 0).label
        
        XCTAssertFalse(Contents.notFoundStaticText.element.waitForExistence(timeout: timeoutForSearchResults), ErrorHelper.elementNotFound)
        tapElement(element: firstElement)
        XCTAssertEqual(titleStaticText.label, cardName)
        return self
    }
    
}
