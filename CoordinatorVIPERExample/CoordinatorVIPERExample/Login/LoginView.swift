//
//  LoginView.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

extension LoginAssembler {
    func assemble(with wireframe: LoginWireframe) -> LoginUI {
        return assemble(with: wireframe, viewType: LoginView.self)
    }
}

class LoginView: UIViewController {
    private let user: LoginUser
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    required init(_ user: LoginUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = ""
    }
    @IBAction func loginAction(_ sender: Any) {
        user.login(username: username.text, password: password.text)
    }
}

extension LoginView: LoginUI {
    func setError(_ text: String?) {
        errorLabel.text = text
    }
}
