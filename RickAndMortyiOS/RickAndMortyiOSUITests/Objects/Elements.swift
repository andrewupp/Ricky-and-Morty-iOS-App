//
//  Elements.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/3.
//

import Foundation
import XCTest

let app: XCUIApplication = XCUIApplication()

// MARK: Tab Bar
enum TabBar: String {
    case CharactersTab = "Characters"
    case LocationsTab = "Locations"
    case EpisodesTab = "Episodes"
    
    var element: XCUIElement {
        if buttons.contains(self) {
            return app.descendants(matching: .tabBar).buttons[self.rawValue].firstMatch
        }
        
        fatalError(ErrorHelper.elementNotFound)
    }
    
    private var buttons: [TabBar] {
        [.CharactersTab, .EpisodesTab, .LocationsTab]
    }
    
}

// MARK: Navigation Bar
enum NavigaitonBar: String {
    
    // MARK: Common Element
    case NavigationBar
    case TitleStaticText
    case SearchField
    case CancelButton = "Cancel"
    case FilterViewButton = "filter"
    
    var element: XCUIElement {
        if buttons.contains(self) {
            return app.descendants(matching: .navigationBar).element(boundBy: 0).buttons[self.rawValue]
        }
        
        if navigationBars.contains(self) {
            return app.descendants(matching: .navigationBar).element(boundBy: 0)
        }
        
        if searchFields.contains(self) {
            return app.descendants(matching: .navigationBar).element(boundBy: 0).searchFields.element(boundBy: 0)
        }
        
        if staticTexts.contains(self) {
            return app.descendants(matching: .navigationBar).element(boundBy: 0).staticTexts.element(boundBy: 0)
        }
        
        fatalError(ErrorHelper.elementNotFound)
    }
    
    var clearButton: XCUIElement {
        if self == .SearchField {
            return self.element.children(matching: .button)["Clear text"]
        } else {
            fatalError(ErrorHelper.parentElementIsNotMatch)
        }
    }
    
    private var buttons: [NavigaitonBar] {
        [.FilterViewButton, .CancelButton]
    }
    
    private var navigationBars: [NavigaitonBar] {
        [.NavigationBar]
    }
    
    private var searchFields: [NavigaitonBar] {
        [.SearchField]
    }
    
    private var staticTexts: [NavigaitonBar] {
        [.TitleStaticText]
    }
}

// MARK: Contents
enum Contents: String {
    case notFoundStaticText
    
    var element: XCUIElement {
        
        let container: XCUIElement.ElementType = TabBar.CharactersTab.element.isSelected ? .collectionView : .table
        
        if staticTexts.contains(self) {
            let predicate1 = NSPredicate(format: "label CONTAINS[c] %@", "No")
            let predicate2 = NSPredicate(format: "label CONTAINS[c] %@", "found")
            return app.descendants(matching: container)
                        .children(matching: .staticText)
                            .element(matching: NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1, predicate2]))
        }
        
        fatalError(ErrorHelper.elementNotFound)
    }
    
    private var staticTexts: [Contents] {
        [.notFoundStaticText]
    }
}

// MARK: Filter View
enum FilterView: String {
    case StatusField = "Select Status"
    case GenderField = "Select Gender"
    case FilterButton = "Filter"
    case ClearButton = "Clear"
    
    var element: XCUIElement {
        let filterView: XCUIElement = app.descendants(matching: .other).element(matching: .other, identifier: "CharacterFilterView").firstMatch
        
        if textFields.contains(self) {
            return filterView.textFields[self.rawValue]
        }
        
        if buttons.contains(self) {
            return filterView.buttons[self.rawValue]
        }
        
        fatalError(ErrorHelper.elementNotFound)
    }
    
    private var textFields: [FilterView] {
        [.StatusField, .GenderField]
    }
    
    private var buttons: [FilterView] {
        [.FilterButton, .ClearButton]
    }
}
