//
//  ScreenFactory.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 15/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

enum ScreenType {
    case login(LoginWireframe)
    case home(HomeWireframe, UserModel, Bool)
}

protocol ScreenFactory {
    func screen(for type: ScreenType) -> UIViewController
}

struct AppScreenFactory: ScreenFactory {
    func screen(for type: ScreenType) -> UIViewController {
        switch type {
        case let .login(wireframe):
            return LoginAssembler(entity: LoginEntity()).assemble(with: wireframe).viewController
        case let .home(wireframe, model, isUser):
            return HomeAssembler(entity: HomeEntity(model: model, isUser: isUser)).assemble(with: wireframe).viewController
        }
    }
    
    
}


