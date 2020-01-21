//
//  LoginInteractor.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class LoginInteractor {
    weak var output: LoginInteractorOutput?
    private let entity: LoginEntity

    init(entity: LoginEntity) {
        self.entity = entity
    }
}

extension LoginInteractor: LoginInteractorInput {
    func arrived() {
        output?.complete()
    }
    
    func login(username: String?, password: String?) {
        guard let username = username, let password = password, !username.isEmpty, !password.isEmpty else {
            output?.failed(error: "No username and password provided")
            return
        }
        
        if username == "Pranjali" && password == "Scott@123" {
            let userModel = UserModel(name: "Pranjali",
                                      designation: "Software engineer",
                                      goal: "Learn from little mistakes")
            output?.loggedIn(userModel: userModel)
        } else {
            output?.failed(error: "User not exsist")
        }
    }
}
