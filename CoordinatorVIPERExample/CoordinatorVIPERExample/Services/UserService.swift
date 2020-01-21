//
//  UserService.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 15/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

enum UserState {
    case loggedOut()
    case loggedIn(UserModel)
}

protocol UserService: class {
    func state() -> UserState
    func login(_ user: UserModel)
    func logout()
}
