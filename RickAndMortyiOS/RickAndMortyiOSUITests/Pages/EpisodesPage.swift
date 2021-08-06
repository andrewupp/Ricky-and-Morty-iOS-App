//
//  EpisodesPage.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation
import XCTest

class EpisodesPage: Page {
    
    let app: XCUIApplication
    let navigationBar: XCUIElement
    let searchField: XCUIElement
    let clearTextButton: XCUIElement
    let titleStaticText: XCUIElement
    let cancelButton: XCUIElement
    
    required init(_ app: XCUIApplication) {
        self.app = app
        self.navigationBar = NavigaitonBar.NavigationBar.element
        self.searchField = NavigaitonBar.SearchField.element
        self.clearTextButton = NavigaitonBar.SearchField.clearButton
        self.titleStaticText = NavigaitonBar.TitleStaticText.element
        self.cancelButton = NavigaitonBar.CancelButton.element
    }
    
    @discardableResult
    func validateSearchResults(_ keyword: String) -> Self {
        let firstElement: XCUIElement = app.descendants(matching: .table).cells.element(boundBy: 0)
        
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
    
}
