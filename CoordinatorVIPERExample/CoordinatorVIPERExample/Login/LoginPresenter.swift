//
//  LoginPresenter.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class LoginPresenter {
    private weak var wireframe: LoginWireframe?
    private let interactor: LoginInteractorInput
    weak var ui: LoginUI?

    init(interactor: LoginInteractorInput,
         wireframe: LoginWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension LoginPresenter: LoginUser {
    func arrive() {
        interactor.arrived()
    }
    
    func login(username: String?, password: String?) {
        ui?.setError(nil)
        interactor.login(username: username, password: password)
    }
}

extension LoginPresenter: LoginInteractorOutput {
    func complete() {}
    
    func loggedIn(userModel: UserModel) {
        wireframe?.loggedIn(userModel)
    }
    
    func failed(error: String) {
        ui?.setError(error)
    }
    

}
