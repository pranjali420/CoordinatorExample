//
//  AppCoordinator.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 15/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let window: UIWindow?
    private let screen: ScreenFactory
    private let service: UserService
    
    init(window: UIWindow,
         screen: ScreenFactory,
         service: UserService,
         router: Router = Router()) {
        self.window = window
        self.screen = screen
        self.service = service
        super.init(router: router)
    }
    
    override func start() {
        window?.rootViewController = router.navigationController
        window?.makeKeyAndVisible()
        switch service.state() {
        case .loggedOut:
            presentLogin(animated: false)
        case let .loggedIn(user):
            presentHome(with: user, isUser: false)
        }
    }
    
    func presentLogin(animated: Bool) {
        router.setRoot(screen.screen(for: .login(self)))
    }
    
    func presentHome(with user: UserModel, isUser: Bool) {
        router.setRoot(screen.screen(for: .home(self, user, isUser)))
    }
}

extension AppCoordinator: LoginWireframe {
    func loggedIn(_ userModel: UserModel) {
        service.login(userModel)
        presentHome(with: userModel, isUser: true)
    }
}

extension AppCoordinator: HomeWireframe {
    func userLoggedOut() {
        service.logout()
        presentLogin(animated: true)
    }
}
