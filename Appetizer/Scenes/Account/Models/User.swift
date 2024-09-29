//
//  User.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 28/09/2024.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
