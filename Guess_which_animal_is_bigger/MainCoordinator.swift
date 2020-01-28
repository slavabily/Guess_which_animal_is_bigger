//
//  MainCoordinator.swift
//  Guess_which_animal_is_bigger
//
//  Created by slava bily on 26/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children = [Coordinator]()
    let vc = ViewController.instantiate()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(_ dataSource: ProjectDataSource) {
        
        vc.dataSource = dataSource
        
        vc.showMainViewAction = showMainView(_:)
        
         navigationController.pushViewController(vc, animated: false)
    }
    
    func showMainView(_ dataSource: ProjectDataSource) {
 
        vc.view = MainView(dataSource: dataSource, buttonAction: { [unowned vc] (b) in
            vc.buttonAction(b)
        })
    }
}
