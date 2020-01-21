//
//  Coordinator.swift
//  CoordinatorVIPERExample
//
//  Created by Pranjali Wagh on 14/05/19.
//  Copyright © 2019 Pranjali Wagh. All rights reserved.
//

import UIKit

class Coordinator: NSObject {
    var router: Router
    lazy var children: [ Coordinator] = []
    
    init(router: Router) {
        self.router = router
        super.init()
    }
    
    func start() {}
    
    func addChild(_ coordinator: Coordinator) {
        guard !children.contains(coordinator) else { return }
        children.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator?) {
        guard let coordinator = coordinator, let index = children.firstIndex(of: coordinator) else { return }
            children.remove(at: index)
    }
    
}
