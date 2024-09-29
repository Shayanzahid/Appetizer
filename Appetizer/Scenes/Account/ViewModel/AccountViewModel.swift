//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by Muhammad Shayan Zahid on 28/09/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    @AppStorage("AppetizerUser") private var userData: Data?
    @Published var user = User()
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            debugPrint("Please fill all the text fields!")
            return false
        }
        
        guard user.email.isValidEmail else {
            debugPrint("The email entered is not valid!!")
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            debugPrint("Profile changes were saved successfully")
        } catch {
            debugPrint("There was an error saving the profile changes!")
        }
    }
    
    func retrieveChanges() {
        guard let userData else { return }
        
        do {
            let user = try JSONDecoder().decode(User.self, from: userData)
            self.user = user
        } catch {
            debugPrint("There was an error retrieving your user profile.")
        }
    }
}
