//
//  Common.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation
import XCTest

protocol Operable {}

extension Operable {
    func tapElement(element: XCUIElement) {
        if element.exists {
            element.tap()
        } else {
            fatalError(ErrorHelper.elementNotFound)
        }
    }
    
    func tapReturnKeyOnKeyBoard(button: UIReturnKeyType) {
        tapElement(element: app.keyboards.buttons[button.keyType].firstMatch)
    }
}
