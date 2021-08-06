//
//  UIReturnKeyType+Extension.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation
import XCTest

extension UIReturnKeyType {
    var keyType: String {
        switch self {
        case .next:
            return "Next"
        case .default:
            return "return"
        case .continue:
            return "Continue"
        case .done:
            return "Done"
        case .emergencyCall:
            return "Emergency call"
        case .go:
            return "Go"
        case .join:
            return "Join"
        case .route:
            return "Route"
        case .yahoo, .google, .search:
            return "Search"
        case .send:
            return "Send"
        @unknown default:
            fatalError()
        }
    }
}
