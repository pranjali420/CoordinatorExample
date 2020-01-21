//
//  HomeProtocols.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

protocol HomeWireframe: class {
    func userLoggedOut()

}

protocol HomeUser: class {
    func loaded()
    func logout()

}

protocol HomeInteractorInput: class {
    func loaded()
    func logout()

}

protocol HomeInteractorOutput: class {
    func update(model: UserModel)
    func setLogoutEnabled(_ enabled: Bool)
    func loggedOut()

}

protocol HomeUI: class {
    init(_ presenter: HomeUser)
    var viewController: UIViewController { get }
    func configure(from model: UserModel)
    func setLogoutEnabled(_ enabled: Bool)
}

extension HomeUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
