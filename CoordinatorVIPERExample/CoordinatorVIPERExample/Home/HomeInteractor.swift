//
//  HomeInteractor.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

class HomeInteractor {
    weak var output: HomeInteractorOutput?
    private let entity: HomeEntity

    init(entity: HomeEntity) {
        self.entity = entity
    }
}

extension HomeInteractor: HomeInteractorInput {
    func loaded() {
        output?.update(model: entity.model)
        output?.setLogoutEnabled(entity.isUser)
    }
    
    func logout() {
        output?.loggedOut()
    }
    

}
