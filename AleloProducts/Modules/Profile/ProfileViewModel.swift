//
//  ProfileViewModel.swift
//  AleloProducts
//
//  Created by Renato Nascimento on 20/11/23.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertInfo?
    
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertInfoObject.userSaveSuccess
        } catch {
            alertItem = AlertInfoObject.invalidUserData
        }
    }
    
    
    func retrieveUser() {
        guard let userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertInfoObject.invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertInfoObject.invalidForm
            return false
        }
        
        return true
    }
    

}
