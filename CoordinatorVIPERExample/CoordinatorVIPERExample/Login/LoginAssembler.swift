//
//  LoginAssembler.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct LoginAssembler {
    let entity: LoginEntity

    func assemble(with wireframe: LoginWireframe,
                  viewType: LoginUI.Type) -> LoginUI {
        let interactor = LoginInteractor(entity: entity)
        let presenter = LoginPresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
