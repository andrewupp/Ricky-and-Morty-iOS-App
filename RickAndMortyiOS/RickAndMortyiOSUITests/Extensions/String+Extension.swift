//
//  String+Extension.swift
//  RickAndMortyiOSUITests
//
//  Created by Wu, Andrew on 2021/8/4.
//

import Foundation

extension String {
    func isEmptyOrWhitespace() -> Bool {
        if self.isEmpty { return true}
        return (self.trimmingCharacters(in: .whitespaces) == "")
    }
}
