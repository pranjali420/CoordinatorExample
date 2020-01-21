//
//  HomeView.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

extension HomeAssembler {
    func assemble(with wireframe: HomeWireframe) -> HomeUI {
        return assemble(with: wireframe, viewType: HomeView.self)
    }
}

class HomeView: UIViewController {
    private let user: HomeUser
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var `continue`: UIButton!
    
    required init(_ user: HomeUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        user.loaded()
    }
    @IBAction func logOut(_ sender: UIButton) {
        user.logout()
    }
    @IBAction func continueTap(_ sender: Any) {
        
    }
}

extension HomeView: HomeUI {
    func configure(from model: UserModel) {
        nameLable.text = "Name: \(model.name)"
        designationLabel.text = "Designation: \(model.designation)"
        goalLabel.text = "Goal: \(model.goal)"
    }
    
    func setLogoutEnabled(_ enabled: Bool) {
        logOutButton.isHidden = !enabled
    }
    

}
