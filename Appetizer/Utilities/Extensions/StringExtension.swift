//
//  StringExtension.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 28/09/2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+\\@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
