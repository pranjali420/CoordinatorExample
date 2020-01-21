//
//  HomeAssembler.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import Foundation

struct HomeAssembler {
    let entity: HomeEntity

    func assemble(with wireframe: HomeWireframe,
                  viewType: HomeUI.Type) -> HomeUI {
        let interactor = HomeInteractor(entity: entity)
        let presenter = HomePresenter(interactor: interactor, wireframe: wireframe)
        let view = viewType.init(presenter)

        interactor.output = presenter
        presenter.ui = view

        return view
    }
}
