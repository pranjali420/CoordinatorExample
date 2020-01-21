//
//  LoginProtocols.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

protocol LoginWireframe: class {
    func loggedIn(_ userModel: UserModel)

}

protocol LoginUser: class {
    func arrive()
    func login(username: String?, password: String?)
}

protocol LoginInteractorInput: class {
    func arrived()
    func login(username: String?, password:String?)
}

protocol LoginInteractorOutput: class {
    func complete()
    func loggedIn(userModel: UserModel)
    func failed(error: String)

}

protocol LoginUI: class {
    init(_ presenter: LoginUser)
    var viewController: UIViewController { get }
    
    func setError(_ text: String?)
}

extension LoginUI where Self: UIViewController {
    var viewController: UIViewController { return self }
}
