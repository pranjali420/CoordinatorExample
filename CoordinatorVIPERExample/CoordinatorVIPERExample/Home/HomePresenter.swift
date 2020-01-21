//
//  HomePresenter.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class HomePresenter {
    private weak var wireframe: HomeWireframe?
    private let interactor: HomeInteractorInput
    weak var ui: HomeUI?

    init(interactor: HomeInteractorInput,
         wireframe: HomeWireframe?) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension HomePresenter: HomeUser {
    func loaded() {
        interactor.loaded()
    }
    
    func logout() {
        interactor.logout()
    }
    

}

extension HomePresenter: HomeInteractorOutput {
    func update(model: UserModel) {
        ui?.configure(from: model)
    }
    
    func setLogoutEnabled(_ enabled: Bool) {
        ui?.setLogoutEnabled(enabled)
    }
    func loggedOut() {
        wireframe?.userLoggedOut()
    }
    

}
