//
//  AppDelegate.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = AppCoordinator(window: window!,
                                    screen: AppScreenFactory(),
                                    service: Service())
        coordinator.start()
        return true
    }
}

class Service: UserService {
    var userModel: UserModel?
    
    init(user: UserModel? = nil) {
        self.userModel = user
    }
    
    func state() -> UserState {
        guard let user = userModel else {
            return .loggedOut()
        }
        return .loggedIn(user)
    }
    
    func login(_ user: UserModel) {
        self.userModel = user
    }
    
    func logout() {
        self.userModel = nil
    }
    
    
}

